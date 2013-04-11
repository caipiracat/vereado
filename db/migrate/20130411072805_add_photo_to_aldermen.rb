class AddPhotoToAldermen < ActiveRecord::Migration
  def change
    add_column :aldermen, :photo, :string
  end
end
