class Car < ApplicationRecord
  belongs_to :citizen
  has_and_belongs_to_many :accident
  validates :manufacter, :model, :registration_date, presence: true

  def self.generate
    10.times do
      Car.create(citizen_id: rand(11..20),
                    manufacter: Faker::Vehicle.manufacture,
                    model: Faker::Vehicle.model,
                    registration_date: Faker::Date.backward(days: 1000))
    end
  end
end
