class AddSignInCountToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :sign_in_count, :int, default: 0
  end
end
