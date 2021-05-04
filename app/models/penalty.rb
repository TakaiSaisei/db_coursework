class Penalty < ApplicationRecord
  belongs_to :accident
  belongs_to :citizen
  validates :amount, :description, presence: true
end
