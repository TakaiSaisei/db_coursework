class Car < ApplicationRecord
  belongs_to :citizen
  validates :manufacter, :model, :registration_date, presence: true
end
