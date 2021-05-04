class CreateAccidents < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents do |t|
      t.references :address, null: false, foreign_key: true
      t.references :officer, null: false, foreign_key: true
      t.string :description, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
