class AddDefaultToQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :display, :boolean,  default: true
  end
end
