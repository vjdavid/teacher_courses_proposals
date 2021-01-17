class Course < ApplicationRecord
  has_many :course_proposals
  has_many :teachers, through: :course_proposals

  validates :title, presence: true, uniqueness: true
end
