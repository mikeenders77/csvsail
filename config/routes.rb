Rails.application.routes.draw do

  resources :comparisons
  devise_for :users
  resources :users

  
  get '/public/download/:id' , to: 'comparison#download'
  root 'comparisons#new'
  get 'pages/about', as: :about

  get '/learn' , to: 'pages#learn'
  #get '/home' to: 'pages#home'

  

end
