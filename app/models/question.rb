class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, :body, presence: true
  belongs_to :user
  scope :by_tag1, -> tag1 { where(:tag1 => tag1) }
  has_many :taggings
  has_many :tags, through: :taggings

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
