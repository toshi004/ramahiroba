class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,  dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :followings, through: :user_favorites, source: :follow
  has_many :likes,  dependent: :destroy

  attachment :image

  def follow(other_user)
    unless self == other_user
      self.user_favorites.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    user_favorite = self.user_favorites.find_by(follow_id: other_user.id)
    user_favorite.destroy if user_favorite
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

end
