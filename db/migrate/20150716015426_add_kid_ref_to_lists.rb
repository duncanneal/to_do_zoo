class AddKidRefToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :kids, index: true, foreign_key: true
  end
end