class City < ApplicationRecord
  belongs_to :country
  validates :name, presence: true, uniqueness: true

  def self.generate
    10.times do
      City.create(country_id: rand(1..10), name: Faker::Address.city)
    end
  end
end
