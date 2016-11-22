class AddActiveToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :active, :boolean, default: false
  end
end
