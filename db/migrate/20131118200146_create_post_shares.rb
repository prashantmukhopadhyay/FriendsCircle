class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :recipient_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    add_index :post_shares, [:post_id, :recipient_id], unique: true, numericality: true

  end
end
