class Image < ActiveRecord::Base
  belongs_to :course
  mount_uploader :image, PictureUploader
end
