Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :hobbies
  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
