class User < ApplicationRecord
	has_secure_password
	mount_uploader :avatar, AvatarUploader
	has_many :messages
	has_many :subscriptions
	has_many :chats, through: :subscriptions
	
	belongs_to :client

	validates :username, uniqueness: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	def existing_chats_users
		existing_chat_users = []
		chats.each do |chat| 
	  		if chat.created_at.day > Time.current.day - 1
		  		chat.subscriptions.each do |subscription|
		  			existing_chat_users << subscription.user if subscription.user != self
	  			end
	  		end
	  	end	  	
  	existing_chat_users
	end
end
