Rails.application.routes.draw do
  # root 'pages#home'
  root 'pages#search'
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'} 

  resources :users, only: [:show]
  resources :listings, except: [:edit] do
    member do
      get 'post'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
    resources :purchases, only: [:create]
  end

  get '/your_purchases' => 'purchases#your_purchases'
  get '/your_sold' => 'purchases#your_sold'
  get 'search' => 'pages#search'


  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  mount ActionCable.server => '/cable'

end
