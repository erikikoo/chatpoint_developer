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

  def block
     if @user.update_attribute('block', true)
        redirect_to action: :admin 
     end
  end
  def unblock
     if @user.update_attribute('block', false)        
        redirect_to action: :admin 
     end
  end

  def admin    
    render 'users/admin/admin'
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
