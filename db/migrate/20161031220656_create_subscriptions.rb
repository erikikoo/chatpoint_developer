class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
