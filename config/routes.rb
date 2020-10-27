Rails.application.routes.draw do
  get 'about' => 'pages#about'
  root 'home#index'
end
