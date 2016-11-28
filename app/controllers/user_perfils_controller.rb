class UserPerfilsController < ApplicationController
  before_action :set_user_perfil, only: [:show, :edit, :update, :destroy, :block, :unblock]

  # GET /user_perfils
  # GET /user_perfils.json
  def index
    @user_perfils = UserPerfil.all
  end

  # GET /user_perfils/1
  # GET /user_perfils/1.json
  def show
  end

  # GET /user_perfils/new
  def new
    @user_perfil = UserPerfil.new
    @user_perfil.build_user
  end

  # GET /user_perfils/1/edit
  def edit
  end

  # POST /user_perfils
  # POST /user_perfils.json
  def create
    @user_perfil = UserPerfil.new(user_perfil_params)        
    
     if @user_perfil.save    
    
       @user_perfil.inscription_in_the_establishments.create(client_id: session[:local_id])    
       session[:user_id] = @user_perfil.user.id        
       cookies.signed[:user_id] = @user_perfil.user.id
       redirect_to "/#{session[:local_name]}/chats"
     else
        render :new
     end
    
  end

  # PATCH/PUT /user_perfils/1
  # PATCH/PUT /user_perfils/1.json
  def update
    
      if @user_perfil.update(user_perfil_params)
         redirect_to "/#{session[:local_name]}/chats"
      else
        render :edit
      end
    
  end

  # DELETE /user_perfils/1
  # DELETE /user_perfils/1.json
  def destroy
    @user_perfil.destroy
    respond_to do |format|
      format.html { redirect_to user_perfils_url, notice: 'User perfil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin
    @user_perfil = UserPerfil.all
    render 'user_perfils/admin/admin'
  end

  def block
     if @user_perfil.update_attribute('block', true)
        redirect_to action: :admin 
     end
  end
  def unblock
     if @user_perfil.update_attribute('block', false)        
        redirect_to action: :admin 
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_perfil
      @user_perfil = UserPerfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_perfil_params
      params.require(:user_perfil).permit(:celular, :email, :nascimento, :sexo, :cidade, :bairro, :avatar, :user_attributes => [:username, :password, :password_confirmation])
    end
end
