class AddImageToMocks < ActiveRecord::Migration
  def change
    remove_column :mocks, :url, :string
    add_column :mocks, :image, :string
  end
end
