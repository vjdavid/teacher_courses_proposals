class Course < ApplicationRecord
  has_many :course_proposals
  has_many :teachers, through: :course_proposals
  has_many :votes, as: :votable

  validates :title, presence: true, uniqueness: true
end
