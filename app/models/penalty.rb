class Penalty < ApplicationRecord
  belongs_to :accident
  belongs_to :citizen
  validates :amount, :payed, presence: true
end
