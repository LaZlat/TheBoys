Rails.application.routes.draw do
  get 'heroname' => 'pages#heroname'
  get 'home' => 'home#index'
  root 'home#index'
end
