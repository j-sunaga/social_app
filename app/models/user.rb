class User < ApplicationRecord

  #アソシエーション
  has_many :timelines

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "user_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "friend_id",
                                  dependent: :destroy

  has_many :following, through: :active_relationships,source: :user
  has_many :followers, through: :passive_relationships,source: :friend

  #Validationの追加
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def follow(other_user)
    following << other_user
  end
end
