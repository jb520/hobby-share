Rails.application.routes.draw do
  root "users#dashboard"

  devise_for :users

  resources :comments
  resources :likes
  resources :posts
  resources :hobbies

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
end
