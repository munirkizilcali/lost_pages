Rails.application.routes.draw do
  if Rails.env.development?
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    end
  post "/graphql", to: "graphql#execute"
  get 'admin/index'
  resources :friendships, only:[:create, :destroy, :index]
  resources :copies
  resources :lendings
  resources :books
  resources :users
  resources :borrowings

  resources :sessions, only:[:create, :destroy, :new]
  resources :admin, only:[:index]
  root "copies#index", :as => 'home'

  get 'library', to: 'copies#index', :as => 'library'

  post "/login" => "sessions#create"
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  post '/add_friend/:id' => 'users#add_friend'

  get '/friends' => 'friendships#index'

  namespace :api do 
    namespace :v1 do 
      resources :friendships, only:[:create, :destroy, :index]
      resources :copies
      resources :lendings
      resources :books
      resources :users
      resources :borrowings

      resources :sessions, only:[:create, :destroy, :new]
      resources :admin, only:[:index]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
