Rails.application.routes.draw do
  resources :hobby_follows
  root "users#dashboard"
  
  devise_for :users

  

  # Routes for the Comment resource:

  # CREATE
  #post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  #get("/comments", { :controller => "comments", :action => "index" })
  
  
  #get("/comments/:id", { :controller => "comments", :action => "show" })
  
  
  # UPDATE
  
  post("/modify_comment/:id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Hobby resource:

  # CREATE
  post("/insert_hobby", { :controller => "hobbies", :action => "create" })
          
  # READ
  # get("/hobbies", { :controller => "hobbies", :action => "index" })
  #get "/hobbies" => "hobby#index"
  
  # get("/hobbies/:id", { :controller => "hobbies", :action => "show" })
  #get "hobbies/:id" => "hobby#show" as: :hobby
  
  # UPDATE
  
  post("/modify_hobby/:id", { :controller => "hobbies", :action => "update" })
  
  # DELETE
  get("/delete_hobby/:id", { :controller => "hobbies", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  #get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  resources :hobbies
  resources :posts
  #resources :likes
  resources :comments
  

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
