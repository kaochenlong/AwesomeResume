Rails.application.routes.draw do
  resources :resumes

  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resource :sessions, only: [:create, :destroy]

  root "resumes#index"
end
