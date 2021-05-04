class Citizen < ApplicationRecord
  belongs_to :address
  has_and_belongs_to_many :accidents
  validates :birth_date, :document_number, :first_name, :middle_name, :second_name, :sex, presence: true
end
