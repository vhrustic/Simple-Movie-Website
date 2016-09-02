Rails.application.routes.draw do
  resources :films
  resources :users do
  	get 'profile'
  end


  #users routes
  match 'register', to: 'users#new', via: [:get], :as => 'register'
  match 'register', to: 'users#create', via: [:post]
  get '/profile' => 'users#profile', :as => 'profile'
  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy', :as => 'logout'

  root 'films#index'
end
