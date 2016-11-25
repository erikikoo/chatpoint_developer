class Client < ApplicationRecord
	#has_secure_password
	has_many :users
	has_many :messages
	has_many :subscriptions
	has_many :chats, through: :subscriptions
	has_many :client_passwords
    has_many :inscription_in_the_establishments
	#validates :password, confirmation: true
	#validates :password_confirmation, presence: true
end
