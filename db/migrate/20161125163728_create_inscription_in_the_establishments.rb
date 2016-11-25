class CreateInscriptionInTheEstablishments < ActiveRecord::Migration[5.0]
  def change
    create_table :inscription_in_the_establishments do |t|
      t.references :user_perfil, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
