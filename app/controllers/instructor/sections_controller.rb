class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_is_creator_of_course, only: [:create]
  before_action :require_authorized_for_current_section, only: [:update]

  def create
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  def update
    current_section.update_attributes(section_params)
    render text: 'updated!'
  end

  private

  def require_authorized_for_current_section
    if current_section.course.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def require_user_is_creator_of_course
    if current_course.user != current_user #course belongs to user
      return render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_course

  def current_course
    if params[:course_id]
    #section doesnt exist yet (for creating)
    @current_course ||= Course.find(params[:course_id])
    else
    #section already exists (for updating)
    current_section.course
    end
  end


  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end

end