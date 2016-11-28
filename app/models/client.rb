class Client < ApplicationRecord
	#has_secure_password
	has_many :users
	has_many :messages
	has_many :subscriptions
	has_many :chats, through: :subscriptions
	has_many :client_passwords, dependent: :destroy
    has_many :inscription_in_the_establishments, dependent: :destroy
	
	validates :cliente,:cidade,:bairro,:contato,:fone,:status, presence: true
	
end
