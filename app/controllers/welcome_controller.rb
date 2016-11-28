class WelcomeController < ApplicationController

	def login
		# remover
		session.destroy
		@commerce = Client.last		
		@login = ClientPassword.find_by(client_id: @commerce.id) unless @commerce.nil?
	end

	def create
		@comercio = Client.find_by(cliente: login_params[:comercio])		
		if @comercio
			@login = ClientPassword.where(client_id: @comercio.id).last unless @comercio.nil?
			if @login.password_digest == login_params[:password] and @comercio
				session[:local_name] = @comercio.cliente.downcase
				session[:local_id] = @login.client.id
				redirect_to "/#{session[:local_name]}/principal"
			else
				@error = 'Erro de autenticação, dirija-se até a gerência e solicite uma senha válida'
				render 'welcome/login'
			end		
		else
			@error = 'Erro de autenticação, dirija-se até a gerência e solicite uma senha válida'
			render 'welcome/login'
		end

	end

	def comercio
		if session[:local_id]
			render :comercio
		else 
			redirect_to root_path
		end	
	end



	private	
	def login_params
		params.require(:logar).permit(:password, :comercio)		
	end

	
end
