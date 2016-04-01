class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps null: false
    end
    add_column :comments, :photo_id, :integer
    add_column :comments, :content, :string
  end
end
