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

  12.times do
    username = Faker::Name.first_name
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
      bio: Faker::Books::Lovecraft.sentence,
      image: "https://robohash.org/#{rand(9999)}"
    )
  end

  p "There are now #{User.count} users."

  



end
