Rails.application.routes.draw do
  resources :pages
  get 'heroname' => 'pages#heroname'
  get 'home' => 'pages#index'
  get 'vought' => 'pages#vought'
  get 'characters' => 'pages#characters'
  get 'about' => 'pages#about'
  get 'search' => 'pages#search'
  get 'login' => 'pages#login'
  get 'register' => 'pages#register'
  get 'settings' => 'pages#settings'
  get 'admin' => 'pages#admin'
  post 'addComment', action: :add_comment, controller: :pages
  post 'addheroname', action: :add_hero_name, controller: :pages
  post 'checkheroname', action: :check_hero_name, controller: :pages
  post 'deletecomment', acton: :delete_comment, controller: :pages
  post 'loginuser', action: :login_user, controller: :pages
  post 'registeruser', action: :register_user, controller: :pages
  root 'pages#login'
end
