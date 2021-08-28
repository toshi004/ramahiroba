class Post < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true

  enum emotion: { happy: 0, angry: 1, sad: 2, fun: 3}

  def start_time
    self.created_at
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def save_tags(tag_list)
    tag_list.each do |tag|

      unless find_tag = Tag.find_by(tag_name: tag.downcase)
        begin
          self.tags.create!(tag_name: tag)
        rescue
          nil
        end
      else
        Tagmap.create!(post_id: self.id, tag_id: find_tag.id)
      end
    end
  end

end
