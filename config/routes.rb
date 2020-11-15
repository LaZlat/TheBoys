Rails.application.routes.draw do
  resources :pages
  get 'heroname' => 'pages#heroname'
  get 'home' => 'home#index'
  get 'vought' => 'pages#vought'
  get 'characters' => 'pages#characters'
  get 'about' => 'pages#about'
  post 'addComment', action: :add_comment, controller: :pages
  post  'addheroname', action: :add_hero_name, controller: :pages
  post 'deletecomment', acton: :delete_comment, controller: :pages
  root 'home#index'
end
