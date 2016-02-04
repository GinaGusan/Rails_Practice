class RemoveNumberOfPhotosFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :number_of_photos, :integer
  end
end
