class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :content, presence: true
  acts_as_votable
  default_scope -> { order(cached_weighted_average: :desc) }
  has_attached_file :avatar, styles: { medium: "300x300>", middle: "230x230>", thumb: "100x100>" }, default_url: "/assets/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
