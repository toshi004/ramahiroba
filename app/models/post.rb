class Post < ApplicationRecord

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  attachment :image

  enum emotion: { happy: 0, angry: 1, sad: 2, fun: 3}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def start_time
    self.created_at
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_tags.delete Tag.find_by(tag: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag: new)
      self.post_tags << new_post_tag
    end
  end

end
