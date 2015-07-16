class Kid < ActiveRecord::Base
  belongs_to :user
  mount_uploader :kidimg, KidimgUploader
end