class CreateUserBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_blocks do |t|
      t.references :user_perfil, foreign_key: true
      t.integer :user_perfil_blocked

      t.timestamps
    end
  end
end
