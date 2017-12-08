# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Start from a clean(ish) state
User.destroy_all
Tag.destroy_all

# Create dummy users
user = User.create! :email => 'john@gmail.com', :username => 'johnthegreat', :password => '123456', :password_confirmation => '123456', :admin => true
user2 = User.create! :email => 'test@gmail.com', :username => 'juniordev', :password => '123456', :password_confirmation => '123456', :admin => false
user3 = User.create! :email => 'test2@gmail.com', :username => 'webdev', :password => '123456', :password_confirmation => '123456', :admin => true

# Example questions
question1 = Question.create! :title => "Sanity", :body => "how do you keep yourself sane and healthy during bootcamp? ", :user_id => user.id
question2 = Question.create! :title => "Functions", :body => "What is a callback function ", :user_id => user2.id
question3 = Question.create! :title => "Routing", :body => "where is the routes.rb file located? ", :user_id => user3.id
question4 = Question.create! :title => "Resume", :body => "is my previous experience relevant now? ", :user_id => user.id
question5 = Question.create! :title => "Success", :body => "What should i do prior to starting bootcamp to have the best chance for success ", :user_id => user2.id

# Example Answers
question1.answers.create! :question_id => 1, :content => 'Put down the computer and exercise', :user_id => user2.id
question1.answers.create! :question_id => 1, :content => 'Suck it up buttercup', :user_id => user3.id
question2.answers.create! :question_id => 2, :content => 'A callback function is a function that is passed to another function ', :user_id => user.id
question2.answers.create! :question_id => 2, :content => 'Who knows ask Oggi ', :user_id => user3.id
question2.answers.create! :question_id => 2, :content => 'Check out Wes Bos, he has lots of great Javascript tutorials', :user_id => user.id
question3.answers.create! :question_id => 3, :content => 'in config file ', :user_id => user2.id
question3.answers.create! :question_id => 3, :content => 'type ctrl T in atom and search ', :user_id => user.id
question4.answers.create! :question_id => 4, :content => 'yes but keep it short ', :user_id => user2.id
question4.answers.create! :question_id => 4, :content => 'no the past is prologue ', :user_id => user3.id
question5.answers.create! :question_id => 5, :content => 'do CodeAcaddemy tutorials ', :user_id => user.id
question5.answers.create! :question_id => 5, :content => 'Learn to type well ', :user_id => user3.id
question5.answers.create! :question_id => 5, :content => 'Thanks for all the advice, everyone', :user_id => user2.id
question5.answers.create! :question_id => 5, :content => 'get comfortable with being uncomfortable...you\'ll be frustrated a lot but it\'s worth it!', :user_id => user.id
question5.answers.create! :question_id => 5, :content => 'I remembered another one...start networking now so you will be ready when it comes time to apply for jobs.', :user_id => user3.id
question5.answers.create! :question_id => 5, :content => 'Thanks for all the advice, everyone', :user_id => user2.id

# Example Blog Posts
blog1 = Blog.create! :title => 'What I\'ve learned about Javascript', :body => 'I have learned about arrow functions and syntax. You should never push your API key to Github. Loops are important and used all the time.', :user_id => user.id
blog2 = Blog.create! :title => 'Another great blog post', :body => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :user_id => user.id
blog3 = Blog.create! :title => '3 Reasons Why Bootcamps are Great', :body => 'Reason 1, Reason 2, Reason 3', :user_id => user2.id
blog4 = Blog.create! :title => 'Why CSS is Important', :body => 'You need CSS to make a webpage look nice.', :user_id => user3.id

# Starter Tags
Tag.create!(name: 'bootcamp prep')
Tag.create!(name: 'interviews')
Tag.create!(name: 'javascript')
Tag.create!(name: 'rails')
Tag.create!(name: 'ruby')
Tag.create!(name: 'css')
Tag.create!(name: 'html')
Tag.create!(name: 'homework help')
Tag.create!(name: 'work/life balance')

# Tags on Questions
Tagging.create!(tag_id: 9, question_id: 1)
Tagging.create!(tag_id: 3, question_id: 2)
Tagging.create!(tag_id: 4, question_id: 3)
Tagging.create!(tag_id: 2, question_id: 4)
Tagging.create!(tag_id: 1, question_id: 5)

# Tags on Blogs
BlogTagging.create!(tag_id: 3, blog_id: 1)
BlogTagging.create!(tag_id: 8, blog_id: 2)
BlogTagging.create!(tag_id: 1, blog_id: 3)
BlogTagging.create!(tag_id: 6, blog_id: 4)
