ActiveAdmin.register Penalty do

  permit_params :accident, :citizen, :description, :amount, :payed

  preserve_default_filters!
  remove_filter :accident
  remove_filter :citizen
  filter :accident_id, as: :string
  filter :citizen_id, as: :string, collection:
    Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }

  index do
    selectable_column
    id_column

    column "Citizen" do |i|
      full_name = Citizen.where(id: i.citizen_id).pluck(:first_name, :middle_name, :second_name).join(' ')
      link_to full_name, admin_citizen_path(i.citizen_id)
    end

    default_columns = active_admin_config.resource_columns - %i[citizen]

    default_columns.each do |attribute|
      column attribute
    end
  end
  
end
