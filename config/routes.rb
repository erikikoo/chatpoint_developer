Rails.application.routes.draw do
  

  root 'welcome#login'
  
  #root 'chats#index'
  #temporary root path for now 
  resources :messages, only:[:create]

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end 

  resources :clients

  resources :sessions, only:[:new, :destroy, :create]
  resources :clients_sessions, only:[:new, :destroy, :create]
  resources :admin_session, only:[:new, :destroy, :create]


  get '/comercio/gerencia'  => 'clients_sessions#new'
  post 'comercio/gerencia'  => 'clients_sessions#create'
  get '/comercio'		        => 'clients#index'
  get 'gerar_senha'         => 'clients#gerar_senha'
  get '/comercio/principal' => 'welcome#comercio'
  post '/gerar_senha'	     	=> 'clients#gerar_senha'
  get '/chats'				      => 'chats#index'
  post '/' => 'welcome#create'
#menu index
  get '/converca'           => 'chats#converca'
  get '/online'            => 'chats#user_online'


#admin
  get '/admin'            => 'admin_session#new'
  get '/admin/principal'  => 'admin#index' 

  get '/admin/clientes'   => 'clients#admin' 
  get '/admin/usuarios'   => 'usuarios#admin' 
  get '/admin/mensagens'  => 'admin#index' 
  

  get '/select_sexo'      => 'chats#change_sexo'
  mount ActionCable.server => '/cable'
end
