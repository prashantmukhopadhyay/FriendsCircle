class FriendsCircle < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name, :user_id, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :friends_circle_memberships,
    class_name: "FriendCircleMembership",
    foreign_key: :friends_circle_id,
    primary_key: :id
  )

  has_many(
    :members,
    through: :friends_circle_memberships,
    source: :member
  )

end
