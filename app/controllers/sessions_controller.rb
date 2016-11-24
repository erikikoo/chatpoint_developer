class SessionsController < ApplicationController

  def new
    if !logged_in?
      @user = User.new
      render 'new'
    end

  end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
       session[:user_id] = @user.id
       cookies.signed[:user_id] = @user.id
       update_login(true)       
       redirect_to '/chats'
    else
      @error = "Usuário e/ou senha inválido"
      render 'sessions/new'
    end
  end

  def destroy
    update_login(false)
    session.destroy
    redirect_to root_path
  end

  private  

  def update_login(u)
    UserPerfil.find(session[:user_id]).update_attributes(is_login: u)
  end
  def login_params
    params.require(:user).permit(:username, :password)
  end
end