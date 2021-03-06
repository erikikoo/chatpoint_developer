class AdminSessionController < ApplicationController
  def new
  	if session[:admin_id]
      redirect_to '/admin/index'
    else
      @admin = Admin.new
    end
  end

  

  def create
  	@admin = Admin.find_by(username: admin_params[:username])  	
  	if @admin && @admin.authenticate(admin_params[:password])
  		session[:admin_id] = @admin.id
  		redirect_to '/admin/index'
  	else
  		@error = 'Error de autenticação'
  		render 'new'
  	end

  end

  def destroy
  	session.destroy
  	redirect_to admin_path
  end

  private 
  def admin_params
  	params.require(:admin).permit(:username, :password)
  end
end
