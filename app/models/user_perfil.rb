class UserPerfil < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :client
  has_one :user
  
  accepts_nested_attributes_for :user, allow_destroy: true
end
