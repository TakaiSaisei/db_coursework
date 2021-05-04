class Country < ApplicationRecord
  validates :name, presence: true

  def self.generate
    10.times do
      Country.create(name: Faker::Address.country)
    end
  end
end
