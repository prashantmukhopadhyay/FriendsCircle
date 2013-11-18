class PostShare < ActiveRecord::Base
  attr_accessible :recipient_id, :post_id

  validates :recipient_id, :post_id, presence: true

  belongs_to(
    :received_post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  belongs_to(
    :recipient,
    class_name: "User",
    foreign_key: :recipient_id,
    primary_key: :id
  )

end
