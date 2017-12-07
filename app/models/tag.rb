class Tag < ApplicationRecord
  has_many :taggings
  has_many :questions, through: :taggings
  has_many :blog_taggings
  has_many :blogs, through: :blog_taggings

  def to_s
    name
  end
end
