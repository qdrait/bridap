class AddColumnsToAnswerDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_details, :answer, index: true
    add_column :answer_details, :question_no, :integer
    add_column :answer_details, :answer, :string
  end
end
