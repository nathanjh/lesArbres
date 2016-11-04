require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

20.times do |idx|
  User.create(:username => Faker::Internet.user_name,
             :email => Faker::Internet.email,
             :password_hash => 'password')
  end

20.times do |idx|
  Question.create(:user_id => rand(1..20),
                  :title => Faker::Lorem.sentence(3),
                  :body => Faker::Lorem.paragraph(2, false, 4))
  end

50.times do |idx|
  Answer.create(:question_id => rand(1..20),
                :user_id => rand(1..20),
                  :body => Faker::Hacker.say_something_smart)
  end

70.times do |idx|
  Comment.create(:commentable_id => rand(1..50),
                 :body => Faker::Hacker.say_something_smart,
                 :user_id => rand(1..20)
                 )
  end

60.times do |idx|
  Vote.create(:votable_id => rand(1..90),
              :user_id => rand(1..20),
              :value => 1)
  end
