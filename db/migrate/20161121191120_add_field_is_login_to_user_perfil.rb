class AddFieldIsLoginToUserPerfil < ActiveRecord::Migration[5.0]
  def change
    add_column :user_perfils, :is_login, :boolean, default: true
  end
end
