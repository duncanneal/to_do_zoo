class AddUserRefToKids < ActiveRecord::Migration
  def change
    add_reference :kids, :user, index: true, foreign_key: true
  end
end
