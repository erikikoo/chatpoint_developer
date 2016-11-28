require 'securerandom'

class ChatsController < ApplicationController    
  
  def index
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users 
    _offline = Subscription.find_by(user_id: current_user.id)
    _offline.update(active: 0) unless _offline.nil?
    get_online
    get_message_no_read

  end

  def create
    @other_user = User.find(params[:other_user])
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat,  :other_user => @other_user.id) 
  end


  def show
    @other_user = UserPerfil.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    Message.where(user_to: params[:user_id], user_id: params[:other_user]).update(status: 2)
    @ativo = Subscription.where(chat_id: params[:id], user_id: params[:user_id]).update(active: 1)    
    @message = Message.new
  end

  def converca
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  def user_online
    chats = current_user.chats    
    @existing_chats_users = current_user.existing_chats_users
    Subscription.where(user_id: current_user).update(active: false)
    get_online
    get_message_no_read
  end

  def refresh_user_and_msn
    get_online
    get_message_no_read
    render :user_online
  end

  def change_sexo    
    if  params[:option] == 'm' 
      get_user_online(params[:option])
      @genero = 'Masculino'
    elsif params[:option] == 'f'
      get_user_online(params[:option])
      @genero = 'Feminino'
    elsif params[:option] == 'i'
      get_user_online(params[:option])
      @genero = 'Indefinido'
    else
      get_online
      get_message_no_read
    end   
    render partial: 'online'
     
  end

  

  def politica
  end

  private
  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.created_at.day.eql?(Time.current.day)
          if (s.user_id == second_user.id) 
            return chat
          end
        end  
      end
    end
    nil
  end
  def get_message_no_read    
    @mesagens = Message.where(user_to: current_user.id, status: 1).group('user_id').count
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def get_online    
    @user = InscriptionInTheEstablishment.where(client_id: session[:local_id])
    @user_online = UserPerfil.where(is_login: true, block: false).where.not(id: session[:user_id])
  end

  def get_user_online(user)    
    @user_online = UserPerfil.where(sexo: user, is_login: true).where.not(id: current_user)
    
  end

end
