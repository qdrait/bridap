class RenameColumnsForAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :answer_details, :answer, :content
  end
end
