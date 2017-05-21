class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :language, null: false
      t.string :screenshot
      t.boolean :status, default: false
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
