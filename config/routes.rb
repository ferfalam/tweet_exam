Rails.application.routes.draw do
  get "/", to: "tweets#index"
  resources :tweets
end
