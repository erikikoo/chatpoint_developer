class AddFieldSenhaToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :password, :string
  end
end
