class AddColumnOwnerToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :owner, :integer
  end
end
