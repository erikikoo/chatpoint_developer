class CreateMensagems < ActiveRecord::Migration[5.0]
  def change
    create_table :mensagems do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :all, default: false

      t.timestamps
    end
  end
end
