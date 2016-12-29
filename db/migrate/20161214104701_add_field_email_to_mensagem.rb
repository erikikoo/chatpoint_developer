class AddFieldEmailToMensagem < ActiveRecord::Migration[5.0]
  def change
    add_column :mensagems, :email, :string
  end	
  
end
