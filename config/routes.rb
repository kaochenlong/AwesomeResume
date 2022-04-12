Rails.application.routes.draw do
  resources :resumes

  post "/", to: "pages#home"

  root "resumes#index"
end
