class Kid < ActiveRecord::Base
  belongs_to :user
  has_many :lists
  mount_uploader :kidimg, KidimgUploader
end