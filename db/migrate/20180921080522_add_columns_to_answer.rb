class AddColumnsToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :user, index: true
    add_reference :answers, :office, index: true
  end
end
