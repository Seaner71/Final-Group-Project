class Blog < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  has_many :blog_taggings
  has_many :tags, through: :blog_taggings
end
