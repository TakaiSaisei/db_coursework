class Citizen < ApplicationRecord
  belongs_to :address
  has_and_belongs_to_many :accidents
  validates :birth_date, :document_number, :first_name, :middle_name, :second_name, :sex, presence: true

  def self.generate
    20.times do
      Citizen.create(address_id: rand(1..10),
                     first_name: Faker::Name.first_name,
                     second_name: Faker::Name.last_name,
                     middle_name: Faker::Name.middle_name,
                     document_number: Faker::IDNumber.valid,
                     birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
                     sex: Faker::Gender.binary_type)
    end
  end
end
