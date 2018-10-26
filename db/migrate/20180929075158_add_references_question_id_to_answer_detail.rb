class AddReferencesQuestionIdToAnswerDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_details, :question
  end
end
