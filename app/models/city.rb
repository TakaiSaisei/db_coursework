class City < ApplicationRecord
  belongs_to :country
  validate :name, presence: true
end
