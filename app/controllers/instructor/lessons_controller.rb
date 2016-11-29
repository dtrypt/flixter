class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

def new
  @lesson = Lesson.new
end

def create
  @lesson = current_section.lessons.create(lesson_params) #.lessons is from model
  redirect_to instructor_course_path(current_section.course) #.course is from model (going up)
end

def show
end

  private

  def require_authorized_for_current_section
    if current_section.course.user != current_user #section belongs to course, course belongs to user
      return render text: 'Unauthorized', status: :unauthorized
    end
  end

helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id]) #stores id from DB
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

end
