class Post < ActiveRecord::Base
  attr_accessible :poster_id, :body

  validates :poster_id, :body, presence: true

  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :poster_id,
    primary_key: :id
  )

  has_many(
    :post_shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :recipients,
    through: :post_shares,
    source: :recipient
  )

end
