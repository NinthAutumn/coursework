Rails.application.routes.draw do
  # get 'pages/home'
  namespace :api, defaults: {format: :json} do
    resources :parks
    resources :users
    resources :cars
    post '/contact',to:"pages#contact"
    get '/slots/:id', to:"slots#show"
    get '/slots/:park_id/open', to:"slots#availableSlot"
    get '/car/:user_id/list', to:"cars#user_car_list"
    # get '/users/:id',to:"users#show"
    get '/users/self/show', to:"users#me"
    scope '/auth' do
      post '/signup', to: "users#create"
      post '/login', to: "user_token#create"
    end
  end 
  root 'pages#home'
  get '/*path', to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
