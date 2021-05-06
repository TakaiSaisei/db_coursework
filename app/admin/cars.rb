ActiveAdmin.register Car do

  permit_params :citizen, :manufacter, :model, :license_plate, :registration_date

  preserve_default_filters!
  remove_filter :accident
  filter :citizen, as: :select, collection:
    Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }

  index do
    selectable_column
    id_column

    column "Owner" do |i|
        full_name = Citizen.where(id: i.citizen_id).pluck(:first_name, :middle_name, :second_name).join(' ')
        link_to full_name, admin_citizen_path(i.citizen_id)
    end

    default_columns = active_admin_config.resource_columns - %i[citizen]

    default_columns.each do |attribute|
      column attribute
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs 'Details' do
      f.input :citizen, as: :select, collection:
        Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }
      f.input :manufacter
      f.input :model
      f.input :license_plate
      f.input :registration_date
    end
    f.actions
  end
  
end
