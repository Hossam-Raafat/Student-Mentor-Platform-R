class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|

      t.string :answer
      t.boolean :status
      t.references :question, foreign_key: true
      t.references :mentor, foreign_key: true

      t.timestamps
    end
  end
end
