class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable

  has_many :posts,  dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :following, class_name: "user_favorite", foreign_key: "following_id"
  has_many :followings, through: :user_favorites
  has_many :likes,  dependent: :destroy

  attachment :image

  validates :name, :presence => {:message => 'ユーザー名を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :password, :presence => {:message => 'パスワードを入力してください'}, on: :create

  def follow(user_id)
    user_favorites.create(following_id: user_id)
  end

  def unfollow(user_id)
    user_favorites.find_by(following_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
