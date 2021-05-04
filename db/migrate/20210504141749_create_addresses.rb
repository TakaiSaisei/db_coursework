class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.string :building
      t.string :apartment

      t.timestamps
    end
  end
end
