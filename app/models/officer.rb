class Officer < ApplicationRecord
  belongs_to :citizen
  validates :rank, presence: true

  def self.generate
    ranks = %w[Major Captain Lieutenant Sergeant Corporal Sheriff]
    10.times do |t|
      random_rank = rand(0..5)
      Officer.create(citizen_id: t + 1, rank: ranks[random_rank])
    end
  end
end
