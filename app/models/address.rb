class Address < ApplicationRecord
  belongs_to :city
  validate :address, presence: true
end
