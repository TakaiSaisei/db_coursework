class Car < ApplicationRecord
  belongs_to :citizen
  has_and_belongs_to_many :accident
  validates :manufacter, :model, :registration_date, :license_plate, presence: true

  def self.generate
    500.times do
      Car.create(citizen_id: rand(1..1000),
                 manufacter: Faker::Vehicle.manufacture,
                 model: Faker::Vehicle.model,
                 registration_date: Faker::Date.backward(days: 3650))
    end
  end

  def self.fix_license
    500.times do |t|
      car = Car.find(t + 1)
      car.license_plate = Faker::Vehicle.license_plate
      car.save
    end
  end
end
