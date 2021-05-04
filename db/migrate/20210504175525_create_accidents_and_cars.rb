class CreateAccidentsAndCars < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents_cars, id: false do |t|
      t.belongs_to :accident
      t.belongs_to :car
    end
  end
end
