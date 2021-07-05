Rails.application.routes.draw do
  get "/", to: "tweets#index"
  resources :tweets do
    collection do
      post :confirm
    end
  end
end
