class ClientsSessionsController < ApplicationController

	def new
		unless logged_in?
			@client = Client.new
			render 'new'
		end
	end

	def create
		@client = Client.find_by(username: login_params[:username], password: login_params[:password])
		unless @client.nil?
			if @client
				session[:client_id] = @client.id
				redirect_to '/comercio'
			else
				@error = "Erro de autenticação! Login e/ou senha incorreto"
	      		render 'clients/new'
	      	end
	     else  	
	     	@error = "Erro de autenticação! Login e/ou senha incorreto"
	     	render 'clients/new'
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
