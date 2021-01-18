class Teacher < ApplicationRecord
  has_secure_password validations: false

  has_many :course_proposals
  has_many :courses, through: :course_proposals
  has_many :votes, as: :votable

  before_validation :generate_token, on: :create

  validates :full_name, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email'
  }

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless self.class.exists?(token: token)
    end
  end
end
