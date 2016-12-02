class AddLogoToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :logo, :string
  end
end
