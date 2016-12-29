class UsersController < ApplicationController
  before_action :get_all_users_for_client, only: [:admin]  
  before_action :get_user, only: [:block, :unblock, :edit, :update]  

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(user_params)
    
    if @user.save      
      session[:user_id] = @user.id        
      cookies.signed[:user_id] = @user.id
      redirect_to chats_path
    else
      render 'new'
    end
  end

  def edit    
    @action = 'edit'
    render :edit
  end  
  # PATCH/PUT /commitments/1
  def update
    if @user.update(user_params) 
      redirect_to :chats
    else            
      render :edit
    end
  end

  def setTimeOut
    UserPerfil.where(is_login: true).each do |user|
        _msn = Message.where(user_id: user.id).last
        if _msn.nil?
          user.update_attributes(is_login: false)
          break
        else  
          _time = _msn.created_at
          _time = _time+45.minutes
          _now = DateTime.current     
          if _now.to_i > _time.to_i
            user.update_attributes(is_login: false)
            Subscription.where(user_id: user_id).update_all(active: false)
          end 
        end  
    end  
  end 

  private

  def get_user
    @user = User.find(params[:id])
  end
  def get_all_users_for_client
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:username, :password_digest, :password_confirmation)
  end
end
