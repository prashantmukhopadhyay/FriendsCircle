class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.integer :poster_id, null: false

      t.timestamps
    end

    add_index :posts, :poster_id, numericality: true
  end
end
