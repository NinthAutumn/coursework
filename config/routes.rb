Rails.application.routes.draw do
  # get 'pages/home'
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
