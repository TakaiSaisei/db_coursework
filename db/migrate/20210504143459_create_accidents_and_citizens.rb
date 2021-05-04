class CreateAccidentsAndCitizens < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents do |t|
      t.references :address, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.references :officer, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end

    create_table :citizens do |t|
      t.references :address, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.string :middle_name, null: false
      t.string :document_number, null: false
      t.date :birth_date, null: false
      t.string :sex, null: false

      t.timestamps
    end

    create_table :accuseds, id: false do |t|
      t.belongs_to :accident
      t.belongs_to :citizens
    end
  end
end
