Rails.application.routes.draw do
  resources :resumes

  resource :users, only: [:create] do
    get :sign_up
  end

  # get "/users/sign_up", to: "users#new"

  post "/", to: "pages#home"

  root "resumes#index"
end
