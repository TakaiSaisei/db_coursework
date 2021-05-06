class Citizen < ApplicationRecord
  belongs_to :address
  has_and_belongs_to_many :accidents
  validates :birth_date, :document_number, :first_name, :middle_name, :second_name, :sex, presence: true
  validates :document_number, uniqueness: true

  def self.generate
    1000.times do |t|
      Citizen.create(address_id: t + 1,
                     first_name: Faker::Name.first_name,
                     second_name: Faker::Name.last_name,
                     middle_name: Faker::Name.middle_name,
                     document_number: Faker::IDNumber.valid,
                     birth_date: Faker::Date.birthday(min_age: 28, max_age: 65),
                     sex: Faker::Gender.binary_type)
    end
  end
end
