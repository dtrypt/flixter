class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_is_creator_of_course

  def new
    @section = Section.new
  end

  def create
    @section = current_course.sections.create(section_params) #posts the section
    redirect_to instructor_course_path(current_course)
  end

  private

  def require_user_is_creator_of_course
    if current_course.user != current_user #course belongs to user
      return render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end


  def section_params
    params.require(:section).permit(:title)
  end

end