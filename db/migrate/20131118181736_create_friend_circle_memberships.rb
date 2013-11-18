class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :user_id, null: false
      t.integer :friends_circle_id, null: false

      t.timestamps
    end

    add_index :friend_circle_memberships, [:user_id, :friends_circle_id], unique: true
  end
end
