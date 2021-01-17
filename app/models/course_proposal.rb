class CourseProposal < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  validates_uniqueness_of :teacher_id, scope: :course_id
end
