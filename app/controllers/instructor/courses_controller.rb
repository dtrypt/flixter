class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_created_course, only: [:show]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.create(course_params) #posts new course
    if @course.valid?
    redirect_to instructor_course_path(@course)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
    @section = Section.new
    @lesson = Lesson.new
  end

  private

  def require_user_created_course
    if current_course.user != current_user
      render text: "Unauthorized", status: :Unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :image, :description, :cost)
  end

end