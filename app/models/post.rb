class Post < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy


  enum emotion: { happy: 0, angry: 1, sad: 2, fun: 3}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def favorite(post_id)
    post_favorites.create(user_id: current_user.id, post_id: post_id)
  end

  def favoriting?(post)
    favoritings.include?(post)
  end

  def start_time
    self.created_at
  end

  def save_tag(tag_lists)
    tag_lists.each do |tag_list|

      unless find_tag = Tag.find_by(tag: tag_list)
        begin
          self.tag_list.create!(tag: tag_list)
        rescue
          nil
        end
      else
        Tagmap.create!(post_id: self.id, tag_id: find_tag.id)
      end
    end
  end

end
