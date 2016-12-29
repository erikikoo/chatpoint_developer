class UserPerfil < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  has_one :user
  has_many :inscription_in_the_establishments
  has_many :user_blocks
  
  validates :email, uniqueness: true
  validates :email, :celular, :nascimento, :sexo, :cidade, :bairro,  presence: true
  
  accepts_nested_attributes_for :user, allow_destroy: true
end
