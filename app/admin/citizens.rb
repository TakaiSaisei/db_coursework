ActiveAdmin.register Citizen do

  permit_params :address, :first_name, :second_name, :middle_name, :document_number, :birth_date, :sex

  preserve_default_filters!
  remove_filter :accidents, :address

  index do
    selectable_column
    id_column

    column "Place of residence" do |i|
      full_address = "#{Country.find(City.find(Address.find(i.address_id).city_id).country_id).name}, #{City.find(Address.find(i.address_id).city_id).name}, #{Address.find(i.address_id).address}"
      link_to full_address, admin_address_path(i.address_id)
    end

    default_columns = active_admin_config.resource_columns - %i[address]

    default_columns.each do |attribute|
      column attribute
    end
  end

  show do
    default_main_content
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs 'Details' do
      f.input :address, as: :select, collection:
        Address.all.collect { |address| ["#{Country.find(City.find(Address.find(address.id).city_id).country_id).name}, #{City.find(Address.find(address.id).city_id).name}, #{Address.find(address.id).address}, #{Address.find(address.id).building}, #{Address.find(address.id).apartment}", address.id] }
      f.input :first_name
      f.input :second_name
      f.input :middle_name
      f.input :document_number
      f.input :birth_date
      f.input :sex
    end
    f.actions
  end

end
