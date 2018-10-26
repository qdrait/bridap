class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :office, foreign_key: true
      t.integer :question_no, null: false
      t.string :title, null: false
      t.integer :input_type, null: false, default: 1
      t.string :choices
      t.integer :order
      t.boolean :required
      t.boolean :display

      t.timestamps
    end

    add_index :questions, [:office_id, :question_no], unique: true
  end
end
