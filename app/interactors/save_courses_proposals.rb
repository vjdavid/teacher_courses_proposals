class SaveCoursesProposals
  include Interactor

  def call
    courses = context.courses
    teacher = context.teacher

    ActiveRecord::Base.transaction do
      teacher.courses.create!(courses)
    rescue ActiveRecord::RecordInvalid => error
      context.fail!(errors: error)
    end
  end
end
