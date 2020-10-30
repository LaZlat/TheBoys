Rails.application.routes.draw do
  get 'heroname' => 'pages#heroname'
  get 'home' => 'home#index'
  get 'comics' => 'pages#comics'
  get 'characters' => 'pages#characters'
  root 'home#index'
end
