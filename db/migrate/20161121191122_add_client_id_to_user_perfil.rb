class AddClientIdToUserPerfil < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_perfils, :client, foreign_key: true
  end
end
