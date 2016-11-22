class CreateUserPerfils < ActiveRecord::Migration[5.0]
  def change
    create_table :user_perfils do |t|      
      t.string :celular
      t.string :email
      t.date :nascimento
      t.string :sexo
      t.string :cidade
      t.string :bairro

      t.timestamps
    end
  end
end
