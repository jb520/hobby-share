json.extract! post, :id, :user_id, :hobby_id, :body, :image, :like_counter, :created_at, :updated_at
json.url post_url(post, format: :json)
