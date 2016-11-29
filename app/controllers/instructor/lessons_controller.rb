class Instructor::LessonsController < ApplicationController

def new
  @section = Section.find(params[:section_id])
  @lesson = Lesson.new
end

def create
  @section = Section.find(params[:section_id])
  @lesson = @section.lessons.create(lesson_params) #.lessons is from model
  redirect_to instructor_course_path(@section.course) #.course is from model (going up)

def show
end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

end
