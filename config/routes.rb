Rails.application.routes.draw do
  # get 'pages/home'
  namespace :api, defaults: {format: :json} do
    resources :parks
    resources :users
    resources :cars
    get '/slot/:id', to:"slots#show"
    # get '/users/:id',to:"users#show"
    
    scope '/auth' do
      post '/signup', to: "users#create"
      post '/login', to: "user_token#create"
    end
  end 
  root 'pages#home'
  get '/*path', to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
