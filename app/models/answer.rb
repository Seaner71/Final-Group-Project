class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  acts_as_votable
  default_scope -> { order(cached_weighted_average: :desc) }
end
