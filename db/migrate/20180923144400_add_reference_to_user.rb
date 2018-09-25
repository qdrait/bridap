class AddReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :office, index: true
  end
end
