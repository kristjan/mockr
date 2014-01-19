class AddCoordsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :top_offset_percentage, :float
    add_column :comments, :left_offset_percentage, :float
  end
end
