class Item < ActiveRecord::Base
  belongs_to :list

  def completed?
    !completed_at.blank?
  end
  mount_uploader :item_image, ItemImageUploader
end