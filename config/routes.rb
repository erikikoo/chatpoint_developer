Rails.application.routes.draw do
  
  get '/user-online'   => 'chats#refresh_user_and_msn'
  resources :user_perfils
  root 'welcome#login'
  
  #root 'chats#index'
  #temporary root path for now 
  resources :messages, only:[:create]

  resources :users, only:[:new, :create, :block,:edit, :update] do
   resources :chats, only: [:index, :show, :create]
  end 

  resources :clients

  resources :sessions, only:[:new, :destroy, :create]
  resources :clients_sessions, only:[:new, :destroy, :create]  
  resources :admin_session, only:[:new, :destroy, :create]

  get  '/:comercio/gerencia'  => 'clients_sessions#new'
  post '/:comercio/gerencia'  => 'clients_sessions#create'
  get  '/comercio/senha'     => 'clients#show_senha'
  get  '/:comercio/principal'      => 'welcome#comercio'
  get  '/comercio/new_senha' => 'clients#new_senha'
  post '/comercio/new_senha'  => 'clients#update_senha'
  
  get 'politica'           => 'chats#politica' 
  

  get 'gerar_senha'         => 'clients#change_password'
  post '/gerar_senha'	     	=> 'clients#change_password'
  get '/:comercio/chats'				      => 'chats#index'
  post '/' => 'welcome#create'

#menu index
  get '/conversa'           => 'chats#converca'
  get '/online'            => 'chats#user_online'


#admin
  get '/admin'            => 'admin_session#new'
  get '/admin/index'  => 'admin#index' 

  get '/admin/clientes'   => 'clients#admin' 
  get '/admin/usuarios'   => 'user_perfils#admin' 
  get '/admin/mensagens'  => 'admin#index' 
  

  get 'block/user/:id'    => 'user_perfils#block'
  get 'unblock/user/:id'  => 'user_perfils#unblock'
  #get '/users/:id/edit'   => 'users#edit'
  #post '/users/:id'       => 'users#update'
  get '/select_sexo'      => 'chats#change_sexo'
  #get '/useronline'       => 'chats#getUserOnline'

  get '/registe_to_establishment'  => "sessions#registe_to_establishment"

  mount ActionCable.server => '/cable'
end
