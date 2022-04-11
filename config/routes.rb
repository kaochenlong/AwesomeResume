Rails.application.routes.draw do
  devise_for :users
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resume"
  post "/resumes", to: "resumes#create"

  post "/", to: "pages#home"

  root "pages#home"
end
