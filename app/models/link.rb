class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  validates :post, :url, presence: true

  belongs_to(
    :post, inverse_of: :links,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

end
