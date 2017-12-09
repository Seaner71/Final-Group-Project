# Bootcamp Overflow
From its humble origins as a game to guess the calories in a Big Mac, Bootcamp Overflow has become premiere resource for current, perspective and past coding bootcamp students. It was created and designed by NYCDA students Fatima Burke, Michael James, Michael Sharkey, Natalie Russo and Sean Smyth.

Bootcamp Overflow was developed in Ruby on Rails 5.1 and requires the installation of the follow non-rails standard gems:

* gem 'jquery-rails'
* gem 'bootstrap', '~> 4.0.0.beta2.1'
* gem 'acts_as_votable', '~> 0.11.1'
* gem "paperclip"
* gem 'devise'
* gem 'bxslider-rails', '~> 4.2', '>= 4.2.5.1'
* gem 'trix'

**Run on your computer:**


From your project folder, clone the git repository:

	git clone https://github.com/Michael-Sharkey/Final-Group-Project.git

Open the project folder:

	cd final-group-project
Install all dependencies:

	bundle install

Create and seed the database:

	rake db:migrate
	rake db:seed

Run the application:

	rails server

To see the application in action, open a browser window and navigate to [http://localhost:3000](http://localhost:3000).

**Sample Account**

You can sign in to a demo account with the following credentials:

| Email        | Password    | Rights |      
| ------------- |:---------:|-----------|
| test@test.com | 123456  |			
| john@gmail.com | 123456  |  Admin User |

## MVC Configuration
Bootcamp Overflow is a platform designed to help students navigate their way through the pressure cooker that is a coding bootcamp. A user can create a profile, ask questions to the Bootcamp Overflow community, answer questions, find advice and create blog posts

## Bootcamp Overflow has 8 Model View Control (MVC) components:

#### User - Created using the devise gem  
	*Associations:*
		has_many :questions
		has_many :blogs, dependent: :destroy
	*Views:*
		Edit, Show
#### Question
 *Associations*
    has_many :answers, dependent: :destroy
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
 *Views*
    New(render partial form), Edit, Index, Show
#### Answer
  *Associations*
    belongs_to :user
    has_many :blog_taggings, dependent: :destroy
    has_many :tags, through: :blog_taggings
    has_many :comments, dependent: :destroy
  *Views*
    New, Edit, Index, Show
#### Blog
	*Associations*
	  belongs_to :question
	  belongs_to :user
	*Views*
    New(partial on Question Show), Edit, Show(partial on Question Show)
#### Comment
	*Associations*
  	belongs_to :blog
 	*Views*
 		partials on Blog new and Blog edit  
#### Tag
	*Associations*
	  belongs_to :user
	  has_many :blog_taggings, dependent: :destroy
	  has_many :tags, through: :blog_taggings
	  has_many :comments, dependent: :destroy
	*Views*
    New (partial Admin only), Index, Show
#### Taggging - Join table  for tags and questions
	*Associations*
	  belongs_to :tag
		belongs_to :question
  *Views*
  	None
#### BlogTagging -Join table  for tags and blogs
	*Associations*
		belongs_to :tag
		belongs_to :question
	*Views*
  	None
