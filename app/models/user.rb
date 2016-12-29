class User < ApplicationRecord
	has_secure_password
	#mount_uploader :avatar, AvatarUploader
	has_many :messages
	has_many :mensagems
	has_many :subscriptions

	has_many :chats, through: :subscriptions
	has_one  :inscription_in_the_establishment
		
	validates :username, uniqueness: true
  	validates :password, confirmation: true
  	validates :password_confirmation, :username, presence: true

	belongs_to :user_perfil, optional: true
	

	
	
	
	
	
	

	def existing_chats_users
		existing_chat_users = []
		chats.each do |chat| 
	  		#if chat.created_at.day.eql?(Time.current.day)
		  		chat.subscriptions.each do |subscription|
		  			existing_chat_users << subscription.user if subscription.user != self
	  			end
	  		#end
	  	end	  	
  	existing_chat_users
	end

end
