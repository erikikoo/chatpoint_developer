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
    #@user_block = UserBlock.where(user_perfil_id: params[:other_user], user: session[:user_id])
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
     idade = (Date.today.year - @user_perfil.nascimento.year) unless @user_perfil.nascimento.nil?
     
      if idade > 17
       if @user_perfil.save
           @user_perfil.inscription_in_the_establishments.create(client_id: session[:local_id])
           session[:user_id] = @user_perfil.user.id
           cookies.signed[:user_id] = @user_perfil.user.id
           redirect_to "/#{session[:local_name]}/chats"
         else          
           render :new 
         end  
       else
          @user_perfil.errors.add(:nascimento,'Você precisa ter +18 anos para acessar este serviço')
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
    @q = UserPerfil.ransack(params[:q])
    @clients = @q.result.includes(:inscription_in_the_establishments)
    @user_perfil = UserPerfil.all
    render 'user_perfils/admin/admin'
  end

  def block
     _target = params[:target]     
     _user_block = UserBlock.where(user_perfil_id: session[:user_id], user_perfil_blocked: params[:id])
     if _user_block.empty?      
      if UserBlock.create(user_perfil_id: session[:user_id],user_perfil_blocked: params[:id])
         if _target.eql?('chat')
            @user_online = UserPerfil.where(is_login: true, block: false).where.not(id: current_user)
            redirect_to user_chats_path(session[:user_id])
         else
          render 'chats/index'
         end 
      end
    end
  end
  
  def unblock
     _target = params[:target]     
     _user_block = UserBlock.find_by(user_perfil_id: session[:user_id], user_perfil_blocked: params[:id])
     unless _user_block.nil?      
      if _user_block.destroy
         if _target.eql?('chat')
            @user_online = UserPerfil.where(is_login: true, block: false).where.not(id: current_user)
            redirect_to user_chats_path(session[:user_id])
         else
          render 'chats/index'
         end 
      end
    end
  end

  def select_user
    @action = 'show'    
    if params[:q][:block_present] and params[:q][:block_present].downcase.eql?('bloqueado')
      params[:q][:block_present] = 1
    elsif params[:q][:block_present] and params[:q][:block_present].downcase.eql?('desbloqueado')
      params[:q][:block_present] = 0
    end 
     if params[:q][:cidade_cont].blank? and params[:q][:bairro_cont].blank? and params[:q][:idade_cont].blank? and params[:q][:sexo_cont].blank? and params[:q][:block_present].blank? #[:block_present].empty? && params[:q][:sexo_cont].empty? && params[:q][:nascimento_cont].empty? && params[:q][:bairro_cont].empty? && params[:q][:cidade_cont].empty?
       @teste = nil
     else
       @teste = true
     end
        
    @q = UserPerfil.ransack(params[:q])
    @user_perfil = @q.result
    render 'user_perfils/admin/select_user'
    
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
