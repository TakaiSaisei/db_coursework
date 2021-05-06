ActiveAdmin.register Accident do

  permit_params :address_id, :officer_id, :description, :date, citizen_ids: [], car_ids: [], penalties_attributes: [:accident_id, :citizen_id, :description, :amount]

  preserve_default_filters!
  filter :officer, as: :select, collection:
    Officer.all.collect { |officer| ["#{officer.rank} #{officer.citizen.first_name} #{officer.citizen.middle_name} #{officer.citizen.second_name}", officer.id] }
  filter :address, as: :select, collection:
    Address.all.collect { |address| ["#{address.city.country.name}, #{address.city.name}, #{address.address}", address.id] }
  filter :citizens, as: :select, collection:
    Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }
  filter :cars, as: :select, collection:
    Car.all.collect { |car| [car.license_plate, car.id] }

  index do
    selectable_column
    id_column

    column "Cars" do |i|
      i.car_ids.map do |car|
        plate = Car.find(car).license_plate
        link_to plate, admin_car_path(car)
      end
    end

    column "Accuseds" do |i|
      i.citizen_ids.map do |citizen|
        full_name = Citizen.where(id: citizen).pluck(:first_name, :middle_name, :second_name).join(' ')
        link_to full_name, admin_citizen_path(citizen)
      end
    end

    column "Address" do |i|
      full_address = "#{Country.find(City.find(Address.find(i.address_id).city_id).country_id).name}, #{City.find(Address.find(i.address_id).city_id).name}, #{Address.find(i.address_id).address}"
      link_to full_address, admin_address_path(i.address_id)
    end

    column "Officer" do |i|
      full_name = "#{Officer.find(i.officer_id).rank}, #{Citizen.where(id: Officer.find(i.officer_id).citizen_id).pluck(:first_name, :middle_name, :second_name).join(' ')}"
      link_to full_name, admin_officer_path(i.officer_id)
    end

    default_columns = active_admin_config.resource_columns - %i[address officer]

    default_columns.each do |attribute|
      column attribute
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs 'Details' do
      f.input :description
      f.input :officer, as: :select, collection:
        Officer.all.collect { |officer| ["#{officer.rank} #{officer.citizen.first_name} #{officer.citizen.middle_name} #{officer.citizen.second_name}", officer.id] }
      f.input :address_id, as: :select, collection:
        Address.all.collect { |address| ["#{address.city.country.name}, #{address.city.name}, #{address.address}", address.id] }
      f.input :citizen_ids, as: :select, input_html: { multiple: true }, collection:
        Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }
      f.input :car_ids, as: :select, input_html: { multiple: true }, collection:
        Car.all.collect { |car| [car.license_plate, car.id] }
      f.input :date
    end

    f.inputs 'Penalty' do
      f.has_many :penalties, heading: false, allow_destroy: true do |p|
        p.input :citizen_id, as: :select, collection:
          Citizen.all.collect { |citizen| ["#{citizen.first_name} #{citizen.middle_name} #{citizen.second_name}", citizen.id] }
        p.input :amount
        p.input :description
      end
    end
    f.actions
  end
end
