Rails.application.routes.draw do
  resources :friendships, only:[:create, :destroy, :index]
  resources :copies
  resources :lendings
  resources :books
  resources :users

  resources :sessions, only:[:create, :destroy, :new]

  root "copies#index"
  post "/login" => "sessions#create"
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  post '/add_friend/:id' => 'users#add_friend'

  get '/friends' => 'friendships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
