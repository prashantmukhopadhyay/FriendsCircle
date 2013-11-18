class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :user_id, :friends_circle_id

  belongs_to(
    :friends_circle,
    class_name: "FriendsCircle",
    foreign_key: :friends_circle_id,
    primary_key: :id
  )

  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

end
