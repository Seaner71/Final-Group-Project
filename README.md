# README

This README would normally document whatever steps are necessary to get the
application up and running.

From its humble origins as a game to guess the calories in a Big Mac, Bootcamp Overflow has become premiere resource for current, perspective and past coding bootcamp students. It was created and designed by NYCDA students Fatima Burke, Michael James, Michael Sharkey, Natalie Russo and Sean Smyth.

Bootcamp Overflow was developed in Ruby on Rails 5.1 and requires the installation of the follow non-rails standard gems:

* gem 'jquery-rails'
* gem 'bootstrap', '~> 4.0.0.beta2.1'
* gem 'acts_as_votable', '~> 0.11.1'
* gem "paperclip"
* gem 'devise'
* gem 'bxslider-rails', '~> 4.2', '>= 4.2.5.1'
* gem 'trix'

# MVC Configuration
Bootcamp OVerflow is a platform designed to help students navigate their way through the pressure cooker that is a coding bootcamp. A user can create a profile, ask questions to the Bootcamp Overflow community, answer questions, find advice and create blog posts

Bootcmp Overflow has 8 Model View Control (MVC) components:

** User - created using the devise gem  
*** Associations:
    has_many :questions
    has_many :blogs, dependent: :destroy

*** Views:
    Edit, Show

** Question
*** Associations
    has_many :answers, dependent: :destroy
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
*** Views
    New(render partial form), Edit, Index, Show

** Blog
*** Associations
    belongs_to :question
    belongs_to :user

*** Views
    New(partial on Question Show), Edit, Show(partial on Question Show)

    ** Answer
    *** Associations
        belongs_to :user
        has_many :blog_taggings, dependent: :destroy
        has_many :tags, through: :blog_taggings
        has_many :comments, dependent: :destroy

    *** Views
        New, Edit, Index, Show
    




Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
