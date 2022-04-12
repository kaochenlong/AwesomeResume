Rails.application.routes.draw do
  resources :resumes

  get "/users/sign_up", to: "users#new"

  post "/", to: "pages#home"

  root "resumes#index"
end
