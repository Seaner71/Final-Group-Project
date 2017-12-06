# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user = User.create! :email => 'john@gmail.com', :password => '123456', :password_confirmation => '123456', :admin => true

Question.destroy_all

question1 = Question.create! :title => "Sanity", :body => "how do you keep yourself sane and healthy during bootcamp? ", :tag1 => 'Self Care', :user_id => user.id
question2 = Question.create! :title => "Functions", :body => "What is a callback function ", :tag1 => 'JavaScript', :user_id => user.id
question3 = Question.create! :title => "Routing", :body => "where is the routes.rb file located? ", :tag1 => 'Rails', :user_id => user.id
question4 = Question.create! :title => "Resume", :body => "is my previous experience relevant now? ", :tag1 => 'Interview', :user_id => user.id
question5 = Question.create! :title => "Success", :body => "What should i do prior to starting bootcamp to have the best chance for success ", :tag1 => 'Bootcamp prep', :user_id => user.id

answer1 = question1.answers.create! :question_id => 1, :content => 'Put down the computer and exercise', :user_id => user.id
answer2 = question1.answers.create! :question_id => 1, :content => 'Suck it up buttercup', :user_id => user.id
answer3 = question2.answers.create! :question_id => 2, :content => 'A callback function is a function that is passed to another function ', :user_id => user.id
answer4 = question2.answers.create! :question_id => 2, :content => 'Who knows ask Oggi ', :user_id => user.id
answer5 = question3.answers.create! :question_id => 3, :content => 'in config file ', :user_id => user.id
answer6 = question3.answers.create! :question_id => 3, :content => 'type ctrl T in atom and search ', :user_id => user.id
answer7 = question4.answers.create! :question_id => 4, :content => 'yes but keep it short ', :user_id => user.id
answer8 = question4.answers.create! :question_id => 4, :content => 'no the past is prologue ', :user_id => user.id
answer9 = question5.answers.create! :question_id => 5, :content => 'do CodeAcaddemy tutorials ', :user_id => user.id
answer10 = question5.answers.create! :question_id => 5, :content => 'Learn to type well ', :user_id => user.id

Tag.create(name: 'js')
