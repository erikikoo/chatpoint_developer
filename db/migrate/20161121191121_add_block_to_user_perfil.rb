class AddBlockToUserPerfil < ActiveRecord::Migration[5.0]
  def change
    add_column :user_perfils, :block, :boolean, default: false
  end
end
