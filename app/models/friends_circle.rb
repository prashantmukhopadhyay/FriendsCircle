class FriendsCircle < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name, :user_id, presence: true

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

end
