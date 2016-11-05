class WelcomeController < ApplicationController

	def login
		# remover
		@login = ClientPassword.last		
	end

	def create
		@login = ClientPassword.last
		unless @login.nil?
			if @login.password_digest == login_params[:password]
				session[:local_id] = @login.client.id
				redirect_to '/comercio/principal'
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
	end

	private	
	def login_params
		params.require(:logar).permit(:password, :username)		
	end
end
