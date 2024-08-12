desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data..."

  if Rails.env.development?
    Comment.destroy_all
    Like.destroy_all
    Hobby.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  names_arr = ["Ginger", "Miss_kitty", "Mimi", "Salem", "Zoey", "Nala", "Cookie", "Sam", "Lucy", "Bailey", "Misty", "Trouble"]

  username = "Alice"
  User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://api.dicebear.com/9.x/lorelei/svg?seed=#{names_arr.sample}&backgroundType=gradientLinear&backgroundRotation=0,360,50,40,20,60&frecklesProbability=30&hairAccessoriesProbability=25&backgroundColor=d1d4f9,c0aede,b6e3f4,ffdfbf,ffd5dc"
    )

  18.times do
    username = Faker::Name.first_name
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://api.dicebear.com/9.x/lorelei/svg?seed=#{names_arr.sample}&backgroundType=gradientLinear&backgroundRotation=0,360,50,40,20,60&frecklesProbability=30&hairAccessoriesProbability=25&backgroundColor=d1d4f9,c0aede,b6e3f4,ffdfbf,ffd5dc"
    )
  end

    20.times do
      Hobby.create(
        name: Faker::Sport.unusual_sport
      )
    end

    p "There are now #{User.count} users."
    p "There are now #{Hobby.count} hobbies."

    users = User.all
    sample_hobby = [] 
    
    10.times do
      rand_hobby = Hobby.all.sample.id
      sample_hobby.push(rand_hobby)
    end

    users.each do |user|
      rand(15).times do
        post = user.posts.create(
          hobby_id: sample_hobby.sample,
          body: Faker::TvShows::AquaTeenHungerForce.quote,
          like_counter: rand(20)
        )
      end
    end

    sample_post = []

    10.times do
      rand_post = Post.all.sample.id
      sample_post.push(rand_post)
    end

    users.each do |user|
      rand(15).times do
        comment = user.comments.create(
          post_id: sample_post.sample,
          body: Faker::TvShows::AquaTeenHungerForce.quote,
        )
      end
    end

  
  p "There are now #{Post.count} posts."
  p "There are now #{Comment.count} comments."

end

task({ :demo_data => :environment }) do
  p "Creating sample data..."

  if Rails.env.development?
    Comment.destroy_all
    Like.destroy_all
    Hobby.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  names_arr = ["Ginger", "Miss_kitty", "Mimi", "Salem", "Zoey", "Nala", "Cookie", "Sam", "Lucy", "Bailey", "Misty", "Trouble"]

  username = "Alice"
  User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://api.dicebear.com/9.x/lorelei/svg?seed=#{names_arr.sample}&backgroundType=gradientLinear&backgroundRotation=0,360,50,40,20,60&frecklesProbability=30&hairAccessoriesProbability=25&backgroundColor=d1d4f9,c0aede,b6e3f4,ffdfbf,ffd5dc"
    )

  18.times do
    username = Faker::Name.first_name
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://api.dicebear.com/9.x/lorelei/svg?seed=#{names_arr.sample}&backgroundType=gradientLinear&backgroundRotation=0,360,50,40,20,60&frecklesProbability=30&hairAccessoriesProbability=25&backgroundColor=d1d4f9,c0aede,b6e3f4,ffdfbf,ffd5dc"
    )
  end

  p "There are now #{User.count} users."
  
end
