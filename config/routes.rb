Rails.application.routes.draw do
  get 'heroname' => 'pages#heroname'
  get 'home' => 'home#index'
  get 'vought' => 'pages#vought'
  get 'characters' => 'pages#characters'
  root 'home#index'
end
