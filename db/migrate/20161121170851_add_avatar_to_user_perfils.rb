class AddAvatarToUserPerfils < ActiveRecord::Migration[5.0]
  def change
    add_column :user_perfils, :avatar, :string
  end
end
