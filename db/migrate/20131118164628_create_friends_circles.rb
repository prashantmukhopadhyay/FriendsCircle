class CreateFriendsCircles < ActiveRecord::Migration
  def change
    create_table :friends_circles do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :friends_circles, :user_id, numericality: true
  end
end
