Rails.application.routes.draw do
  resources :films
  
  #users routes
  match 'register', to: 'users#new', via: [:get]
  match 'register', to: 'users#create', via: [:post]
end
