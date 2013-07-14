CupcakeGame::Application.routes.draw do

  
  root :to => "home#index"

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"} do
    get "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign 
  end

  resources :cupcakes
  resources :cookies
  resources :frostings
  resources :toppings
  resources :ice_creams
  match 'win', :to => 'cupcakes#win'
  match 'lose', :to => 'cupcakes#lose'

end
