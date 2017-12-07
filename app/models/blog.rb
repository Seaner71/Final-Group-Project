class Blog < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  has_many :blog_taggings, dependent: :destroy
  has_many :tags, through: :blog_taggings
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 6 }


  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

end
