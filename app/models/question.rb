class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, :body, presence: true
  belongs_to :user
  scope :by_tag1, -> tag1 { where(:tag1 => tag1) }
  has_many :taggings
  has_many :tags, through: :taggings
end
