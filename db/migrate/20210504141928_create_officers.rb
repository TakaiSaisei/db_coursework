class CreateOfficers < ActiveRecord::Migration[6.1]
  def change
    create_table :officers do |t|
      t.references :citizen, null: false, foreign_key: true
      t.string :rank, null: false

      t.timestamps
    end
  end
end
