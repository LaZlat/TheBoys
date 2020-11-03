Rails.application.routes.draw do
  get 'heroname' => 'pages#heroname'
  get 'home' => 'home#index'
  get 'vought' => 'pages#vought'
  get 'characters' => 'pages#characters'
  get 'about' => 'pages#about'
  root 'home#index'
end
