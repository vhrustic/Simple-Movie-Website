Rails.application.routes.draw do
  resources :films
  
  #users routes
  match 'register', to: 'users#new', via: [:get]
  match 'register', to: 'users#create', via: [:post]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
