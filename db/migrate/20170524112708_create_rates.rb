class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :star
      t.references :response, foreign_key: true
      t.references :student, foreign_key: true
      t.references :mentor, foreign_key: true

      t.timestamps
    end
  end
end
