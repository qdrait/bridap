class AddLoginTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_type, :integer
  end
end
