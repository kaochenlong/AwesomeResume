Rails.application.routes.draw do
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resume"

  post "/", to: "pages#home"

  root "pages#home"
end
