class Accident < ApplicationRecord
  belongs_to :address
  belongs_to :car
  belongs_to :officer
  has_and_belongs_to_many :citizens
  validate :date, presence: true
end
