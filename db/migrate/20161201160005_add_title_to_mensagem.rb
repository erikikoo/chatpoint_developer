class AddTitleToMensagem < ActiveRecord::Migration[5.0]
  def change
    add_column :mensagems, :title, :string
  end
end
