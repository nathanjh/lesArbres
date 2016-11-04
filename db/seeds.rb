require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

20.times do |idx|
  User.create({:username => Faker::Internet.user_name,
               :email => Faker::Internet.email,
               :password => 'password'})
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
  choose = rand(1..2)
  if choose == 1
    Question.find(rand(1..20)).comments.create(
                   :body => Faker::Hacker.say_something_smart,
                   :user_id => rand(1..20)
                   )
    else
    Answer.find(rand(1..20)).comments.create(
                   :body => Faker::Hacker.say_something_smart,
                   :user_id => rand(1..20)
                   )
    end
  end

100.times do |idx|
  choose = rand(1..3)
  vote_val = [1,-1].sample
  if choose == 1
      Question.find(rand(1..20)).votes.create(
                   :value => vote_val,
                   :user_id => rand(1..20)
                   )
    elsif choose == 2
      Answer.find(rand(1..50)).votes.create(
                   :value => vote_val,
                   :user_id => rand(1..20)
                   )
    else
    Comment.find(rand(1..70)).votes.create(
                   :value => vote_val,
                   :user_id => rand(1..20)
                   )
    end
  end
