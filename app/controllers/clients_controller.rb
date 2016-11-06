class ClientsController < ApplicationController
	before_action :get_client, only: [:edit, :update, :destroy]
	before_action :get_all_client, only: [:update, :destroy, :adim, :create]
	
	def new
		@client = Client.new		
	end

	def create
		@client = Client.new(client_params)
		@client.username = @client.cliente
		@client.password = '123456'
		@client.password_confirmation = '123456'
		if @client.save
			@senha = gerar_senha
			ClientPassword.create(client_id: @client.id, password_digest: @senha)			
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
		# if get_last_password.nil?
		# 	@senha = gerar_senha
		# 	ClientPassword.create(password_digest: @senha)
		# end
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

		#ClientPassword.create(client_id: session[:client_id], password_digest: @senha)
		#get_last_password
		
	end

	def change_password
		gerar_senha
		ClientPassword.create(client_id: session[:client_id], password_digest: @senha)
		get_last_password
	end



	def show_senha		
		get_last_password
	end

	def new_senha
		@client = Client.new
	end

	def update_senha
		@client =  Client.find(session[:client_id])

		@client.update_attribute('password', client_params[:password] )
		#@client =  Client.find(session[:client_id]).update_attribute('password', client_params[:password])
		if @client
			@sign_in_count = @client.sign_in_count + 1
				@client.update_attribute('sign_in_count', @sign_in_count)
			redirect_to '/comercio/senha'
		else
			render 'new_senha'
		end
	end

	def admin
		@clients = Client.all
		respond_to do |f|
			f.js {render :admin}
		end
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
		params.require(:client).permit(:cliente, :cidade, :bairro, :contato, :fone, :status, :url, :password, :password_confirmation)
	end
end
