class List < ActiveRecord::Base
  belongs_to :kid
  has_many :items
end