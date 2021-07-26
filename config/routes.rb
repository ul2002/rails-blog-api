Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users
      post "register" => "users#register"
      post "login" => "users#login"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
