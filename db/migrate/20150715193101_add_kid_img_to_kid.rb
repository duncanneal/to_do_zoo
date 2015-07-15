class AddKidImgToKid < ActiveRecord::Migration
  def change
    add_column :kids, :kidimg, :string
  end
end
