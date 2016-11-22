class AddUserPerfilRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :user_perfil, foreign_key: true
  end
end
