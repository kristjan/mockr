class CreateMocks < ActiveRecord::Migration
  def change
    create_table :mocks do |t|
      t.integer :creator_id
      t.string :url

      t.timestamps
    end
  end
end
