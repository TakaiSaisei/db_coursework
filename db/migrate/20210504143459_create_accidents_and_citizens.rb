class CreateAccidentsAndCitizens < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents_citizens, id: false do |t|
      t.belongs_to :accident
      t.belongs_to :citizen
    end
  end
end
