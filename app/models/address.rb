class Address < ApplicationRecord
  belongs_to :city
  validates :address, presence: true

  def self.generate
    10.times do
      address = Address.new(city_id: rand(1..10), address: Faker::Address.street_address,
                            building: Faker::Address.building_number, apartment: Faker::Address.secondary_address)
      address.save
    end

    10.times do
      Address.create(city_id: rand(1..10), address: Faker::Address.street_address)
    end
  end
end
