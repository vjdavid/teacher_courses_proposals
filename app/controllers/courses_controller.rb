class CoursesController < ApplicationController
  before_action :find_course, only: [:show]

  def index
    @courses = Course.includes(:votes).order(created_at: :desc)

    render json: @courses
  end

  def show
    render json: @course.course_proposals.includes(:teacher, :votes)
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end
end
