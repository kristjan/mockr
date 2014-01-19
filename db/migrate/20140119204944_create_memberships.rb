class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id,         null: false
      t.integer :organization_id, null: false
      t.string  :role,            null: false

      t.timestamps
    end

    add_index :memberships, [:organization_id, :user_id], unique: true
    add_index :memberships, :user_id
  end
end
