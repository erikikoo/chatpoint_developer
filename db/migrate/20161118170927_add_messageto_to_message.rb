class AddMessagetoToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user_to, :int
  end
end
