class CreateClientPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :client_passwords do |t|
      t.references :client, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
