require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  before_validation(on: :create) do
    self.session_token = User.generate_session_token!
    self.auth_token = User.generate_auth_token!
  end

  validates :email, :password, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5, too_short: "too short" }


  has_many(
    :friends_circles,
    class_name: "FriendsCircle",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :friends_circle_memberships,
    class_name: "FriendCircleMembership",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :circles,
    through: :friends_circle_memberships,
    source: :friends_circle
  )



  def self.generate_session_token!
    SecureRandom::urlsafe_base64(16)
  end

  def self.generate_auth_token!
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    if user.nil?
      nil
    elsif user.is_password?(password)
      return user
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    # self.update_attribute(:password_digest, BCrypt::Password.create(password))
  end


end
