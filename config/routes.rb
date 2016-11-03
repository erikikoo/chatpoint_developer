Rails.application.routes.draw do
  root 'welcome#login'
  
  #root 'chats#index'
  #temporary root path for now 
  resources :messages, only:[:create]

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end 

  resources :sessions, only:[:new, :destroy, :create]
  resources :clients_sessions, only:[:new, :destroy, :create]


  get '/comercio/gerencia'  => 'clients_sessions#new'
  post 'comercio/gerencia'  => 'clients_sessions#create'
  get '/comercio'		        => 'clients#index'
  get 'gerar_senha'         => 'clients#gerar_senha'
  get '/comercio/principal' => 'welcome#comercio'
  post '/'				        	=> 'welcome#create'
  get '/chats'				      => 'chats#index'
#menu index
  get '/converca'           => 'chats#converca'
  get '/online'            => 'chats#user_online'

  mount ActionCable.server => '/cable'
end
