class ClientsController < ApplicationController
	before_action :get_client, only: [:edit, :update, :destroy]
	before_action :get_all_client, only: [:update, :destroy, :adim, :create]
	
	def new
		@client = Client.new
		
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to action: 'admin'
		else
			render :new
		end

		# @client = Client.find_by(username: client_params[:username], password: client_params[:password])
		# unless @client.nil?
		# 	if @client
		# 		session[:client_id] = @client.id
		# 		redirect_to '/comercio'
				
		# 	else
		# 		@error = "Erro de autenticação! Login e/ou senha incorreto 1"
	 #      		render 'clients/new'
	 #      	end
	 #     else  	
	 #     	@error = "Erro de autenticação! Login e/ou senha incorreto"
	 #     	render 'clients/new'
	 #     end
	end

	def index
		@senha = ClientPassword.new
		get_last_password
	end

	def edit
		
	end

	def update
		@client.update_attributes(client_params)
		@clients = Client.all

		render action: 'admin'
	end

	def destroy		
		@client.destroy
		render action: 'admin'
	end
	

	def gerar_senha(size = 10)
		charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  		@senha = (0...size).map{ charset.to_a[rand(charset.size)] }.join

		ClientPassword.create(client_id: session[:client_id], password_digest: @senha)
		get_last_password
		
	end

	def admin
		@clients = Client.all
		
	end

	private

	def get_all_client
		@clients = Client.all
	end

	def get_client
		@client = Client.find(params[:id])
	end

	def get_last_password
		@commerce_password = ClientPassword.where(client_id: session[:client_id]).last
	end

	def client_params
		params.require(:client).permit(:cliente, :cidade, :bairro, :contato, :fone, :status, :url)
	end
end
