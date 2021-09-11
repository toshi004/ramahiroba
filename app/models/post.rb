class Post < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  enum emotion: { happy: 0, angry: 1, sad: 2, fun: 3}

  validates :title, :presence => {:message => 'タイトルを入力してください'}, length: {maximum: 20}
  validates :text, :presence => {:message => '本文を入力してください'}, length: {maximum: 200}
  validates :emotion, :presence => {:message => '気持ちを選択してください'}


  def start_time
    self.created_at
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
    post_favorites.where(user_id: user.id).exists?
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << post_tag
    end
  end

end
