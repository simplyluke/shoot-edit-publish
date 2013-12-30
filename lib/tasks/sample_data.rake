namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do 
    make_users
    make_points
  end
end

def make_users
  User.new(email: "luke@simplyluke.com", username: "cenhyperion", password: "testtest", password_confirmation: "testtest").save

  50.times do |n|
    email = "user#{n+1}@simplyluke.com" 
    username = "user#{n+1}"
    password = "testtest"
    User.new(email: email, username: username, password: password, password_confirmation: password).save
  end
end

def make_points
  users = User.all(limit: 7)
  50.times do
    value = 60
    activity = 'shot'
    users.each { |user| user.points.create!(value: value, activity: activity) }
  end
end
