class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.string :description
    	t.string :title
    	t.timestamps null: false
    end
  end
end
