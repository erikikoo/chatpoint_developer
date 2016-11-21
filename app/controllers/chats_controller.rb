require 'securerandom'

class ChatsController < ApplicationController  
  
  before_action :get_message_no_read, only: [:index, :user_online, :change_sexo]
  def index
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users 
    _offline = Subscription.find_by(user_id: current_user.id)
    _offline.update(active: 0) unless _offline.nil?
    @user_online = User.where(is_login: true)  
    #@mesagens = Message.where(user_to: current_user.id, status: 1).group('user_id').count
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
    @other_user = User.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    Message.where(user_to: params[:user_id], user_id: params[:other_user]).update(status: 2)
    @ativo = Subscription.where(chat_id: params[:id], user_id: params[:user_id]).update(active: 1)
    #@chat = Chat.find_by('id = ? AND created_at < ? AND created_at > ?',params[:id],(Time.current),(Time.current - 1.day))
    @message = Message.new
  end

  def converca
    chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  def user_online
    chats = current_user.chats    
    @existing_chats_users = current_user.existing_chats_users
    Subscription.where(user_id: current_user).update(active: 0)
    @user_online = User.where(is_login: true)
    #@mesagens = Message.where(user_to: current_user, status: 1).group('user_id').count
  end

  def change_sexo    
    if  params[:option] == 'm' 
      @user_online = User.where(sexo: 'm',is_login: true).where.not(block: true, id: current_user )
      @genero = 'Masculino'
    elsif params[:option] == 'f'
      @user_online = User.where(sexo: 'f',is_login: true).where.not(block: true, id: current_user )
      @genero = 'Feminino'
    elsif params[:option] == 'i'
      @user_online = User.where(sexo: 'i',is_login: true).where.not(block: true, id: current_user )    
      @genero = 'Indefinido'
    end   
    render partial: 'online'
     
  end

  def getUserOnline
    @user_online = User.where(is_login: true)
    render partial: 'online'
  end

  private
  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    nil
  end

  def get_message_no_read
    @mesagens = Message.where(user_to: current_user, status: 1).group('user_id').count
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
