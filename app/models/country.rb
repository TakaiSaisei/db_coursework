class Country < ApplicationRecord
  validate :name, presence: true
end
