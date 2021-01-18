class Teacher < ApplicationRecord
  has_many :course_proposals
  has_many :courses, through: :course_proposals
  has_many :votes, as: :votable

  validates :full_name, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email'
  }
end
