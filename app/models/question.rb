class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  scope :by_tag1, -> tag1 { where(:tag1 => tag1) }
end
