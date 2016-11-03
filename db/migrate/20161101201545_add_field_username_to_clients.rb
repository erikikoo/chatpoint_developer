class AddFieldUsernameToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :username, :string
  end
end
