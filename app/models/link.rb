class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  validates :post_id, :url, presence: true

  belongs_to(
    :post,
    :class_name = "Post",
    :foreign_key = :post_id,
    :primary_key = :id
  )

end
