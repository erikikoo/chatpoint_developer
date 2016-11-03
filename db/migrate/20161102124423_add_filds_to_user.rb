class AddFildsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :celular, :string
    add_column :users, :email, :string
    add_column :users, :nascimento, :date
    add_column :users, :sexo, :char
    add_column :users, :cidade, :string
    add_column :users, :bairro, :string
  end
end
