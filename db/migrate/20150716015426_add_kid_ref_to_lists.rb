class AddKidRefToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :kid, index: true, foreign_key: true
  end
end