class AddActiveToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :active, :char, default: 0
  end
end
