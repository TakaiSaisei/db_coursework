class Officer < ApplicationRecord
  belongs_to :citizen
  validate :rank, presence: true
end
