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

  username = "Alice"
  User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://robohash.org/#{rand(9999)}"
    )

  18.times do
    username = Faker::Name.first_name
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://robohash.org/#{rand(9999)}"
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

    users.each do |user|
      rand(15).times do
        post = user.posts.create(
          hobby_id: 1,
          body: Faker::TvShows::AquaTeenHungerForce.quote,
          like_counter: rand(20)
        )
      end
    end

  
  p "There are now #{Post.count} posts."
end
