class RegisterTeacher
  include Interactor

  def call
    courses = context.proposal_params.delete('courses')
    teacher = Teacher.create(context.proposal_params)

    if teacher.persisted?
      context.teacher = teacher
      context.courses = courses
    else
      context.fail!(errors: teacher.errors.messages)
    end
  end
end
