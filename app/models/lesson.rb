class Lesson < ActiveRecord::Base
  belongs_to :section
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :section_id

  def next_lesson
    nextlesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if nextlesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    return nextlesson
  end

  def previous_lesson
    prevlesson = section.lessons.where("row_order < ?", self.row_order).rank(:row_order).last
    if prevlesson.blank? && section.previous_section
      return section.previous_section.lessons.rank(:row_order).last
    end
    return prevlesson
  end

end
