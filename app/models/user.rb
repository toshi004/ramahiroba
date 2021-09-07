class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,  dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :following, class_name: "user_favorite", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :user_favorites
  has_many :likes,  dependent: :destroy

  attachment :image

  def follow(user_id)
    user_favorites.create(following_id: user_id)
  end

  def unfollow(user_id)
    user_favorites.find_by(following_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # 投稿お気に入り
  # # def favorite
  # #   post_favorites.create(user_id: current_user.id, post_id: post_id)
  # # end

  # def favoriting?(post)
  #   favoriting.include?(post)
  # end

end
