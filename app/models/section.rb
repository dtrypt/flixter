class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  include RankedModel
  ranks :row_order, :with_same => :course_id

  def next_section
    nextsection = course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
    return nextsection
  end

  def previous_section
    prevsection = course.sections.where("row_order < ?", self.row_order).rank(:row_order).last
    return prevsection
end

end
