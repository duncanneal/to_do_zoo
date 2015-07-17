class List < ActiveRecord::Base
  belongs_to :kid
  belongs_to :user
  has_many :items
end