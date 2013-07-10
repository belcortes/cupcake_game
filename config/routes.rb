CupcakeGame::Application.routes.draw do

  
  root :to => "home#index"

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :cupcakes
  resources :cookies
  resources :frostings
  resources :toppings
  resources :ice_creams

end
