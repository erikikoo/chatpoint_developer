class AddFieldIsLoginToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_login, :boolean, default: true
  end
end
