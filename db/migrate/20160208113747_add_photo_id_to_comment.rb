class AddPhotoIdToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :photo_id, :integer
  end
end
