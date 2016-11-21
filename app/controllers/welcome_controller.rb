class WelcomeController < ApplicationController

	def login
		# remover
		@commerce = Client.last		
		@login = ClientPassword.find_by(client_id: @commerce.id)
	end

	def create
		@comercio = Client.find_by(cliente: login_params[:comercio])		
		@login = ClientPassword.where(client_id: @comercio.id).last unless @comercio.nil?
		if @login.password_digest == login_params[:password] and @comercio
			session[:local_id] = @login.client.id
			redirect_to '/comercio/principal'
		else
			@error = 'Erro de autenticação, dirija-se até a gerência e solicite uma senha válida'
			render 'welcome/login'
		end		

	end

	def comercio
	end



	private	
	def login_params
		params.require(:logar).permit(:password, :comercio)		
	end

	
end
