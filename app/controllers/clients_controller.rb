class ClientsController < ApplicationController

	def new
		@client = Client.new
	end

	def create
		@client = Client.find_by(username: user_params[:username], password: user_params[:password])
		unless @client.nil?
			if @client
				session[:client_id] = @client.id
				redirect_to '/comercio'
				
			else
				@error = "Erro de autenticação! Login e/ou senha incorreto 1"
	      		render 'clients/new'
	      	end
	     else  	
	     	@error = "Erro de autenticação! Login e/ou senha incorreto"
	     	render 'clients/new'
	     end
	end

	def index
		@senha = ClientPassword.new
		get_last_password
	end
	

	def gerar_senha(size = 10)
		charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  		@senha = (0...size).map{ charset.to_a[rand(charset.size)] }.join

		ClientPassword.create(client_id: session[:client_id], password_digest: @senha)
		get_last_password
		
	end

	private

	def get_last_password
		@commerce_password = ClientPassword.where(client_id: session[:client_id]).last
	end

	def user_params
		params.require(:client).permit(:client, :cidade, :bairro, :contato, :fone, :status, :url)
	end
end
