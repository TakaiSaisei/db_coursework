class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :citizen, null: false, foreign_key: true
      t.string :manufacter, null: false
      t.string :model, null: false
      t.date :registration_date, null: false

      t.timestamps
    end
  end
end
