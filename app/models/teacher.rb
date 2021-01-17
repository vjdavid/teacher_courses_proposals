class Teacher < ApplicationRecord
  has_many :course_proposals
  has_many :courses, through: :course_proposals
end
