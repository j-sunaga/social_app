class User < ApplicationRecord

  #アソシエーション
  has_many :timelines

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "user_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "friend_id",
                                  dependent: :destroy

  has_many :friend, through: :active_relationships,source: :friend

  #Validationの追加
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  #Image
  mount_uploader :image, ImageUploader

  # 友達追加
  def be_friend(other_user)
     active_relationships.create(friend_id: other_user.id)
     passive_relationships.create(user_id: other_user.id)
  end

  #友達解除する
 def un_friend(other_user)
   active_relationships.find_by(friend_id: other_user.id).destroy
   passive_relationships.find_by(user_id: other_user.id).destroy
 end

 # 現在のユーザーが友達だったらtrueを返す
 def friend?(other_user)
   friend.include?(other_user)
 end


end
