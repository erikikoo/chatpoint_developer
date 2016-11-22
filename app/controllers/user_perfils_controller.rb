class UserPerfilsController < ApplicationController
  before_action :set_user_perfil, only: [:show, :edit, :update, :destroy]

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
    @user_perfil.client_id = session[:local_id]
    if @user_perfil.save
       session[:user_id] = @user_perfil.user.id        
      cookies.signed[:user_id] = @user_perfil.user.id
      redirect_to chats_path
    else
       render :new
    end
    
  end

  # PATCH/PUT /user_perfils/1
  # PATCH/PUT /user_perfils/1.json
  def update
    respond_to do |format|
      if @user_perfil.update(user_perfil_params)
        format.html { redirect_to @user_perfil, notice: 'User perfil was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_perfil }
      else
        format.html { render :edit }
        format.json { render json: @user_perfil.errors, status: :unprocessable_entity }
      end
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
