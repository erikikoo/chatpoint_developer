class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :cliente
      t.string :cidade
      t.string :bairro
      t.string :contato
      t.string :fone
      t.boolean :status
      t.string :url

      t.timestamps
    end
  end
end
