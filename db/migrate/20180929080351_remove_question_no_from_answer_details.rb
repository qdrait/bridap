class RemoveQuestionNoFromAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_details, :question_no, :integer
  end
end
