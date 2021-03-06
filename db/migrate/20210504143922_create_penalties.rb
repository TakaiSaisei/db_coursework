class CreatePenalties < ActiveRecord::Migration[6.1]
  def change
    create_table :penalties do |t|
      t.references :accident, null: false, foreign_key: true
      t.references :citizen, null: false, foreign_key: true
      t.string :description, null: false
      t.integer :amount, null: false
      t.boolean :payed, default: false

      t.timestamps
    end
  end
end
