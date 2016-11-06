class ClientsSessionsController < ApplicationController

	def new
		if session[:client_id]
			redirect_to '/comercio/senha'
		else
			@client = Client.new
			render 'new'
		end		
	end

	def create
		@client = Client.new(login_params)
		@client = Client.find_by(username: login_params[:username], password: login_params[:password])
		unless @client.nil?
			if @client
				@sign_in_count = @client.sign_in_count + 1
				Client.find(@client.id).update_attributes(sign_in_count: @sign_in_count)
				session[:client_id] = @client.id
				if @sign_in_count == 1
					redirect_to '/comercio/new_senha' 
				else 
					redirect_to '/comercio/senha'				
				end
			else
				@error = "Erro de autenticação! Login e/ou senha incorreto"
	      		render 'clients_sessions/new'
	      	end
	     else  	
	     	@error = "Erro de autenticação! Login e/ou senha incorreto"
	     	render 'clients_sessions/new'
	     end
	end

	def destroy
		session.destroy
		redirect_to root_path
	end

	private 

	def login_params
		params.require(:client).permit(:username, :password)
	end
end
