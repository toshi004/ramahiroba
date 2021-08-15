class Post < ApplicationRecord

  belongs_to :user
  belongs_to :tagmap
  has_many :post_comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

  attachment :image

  enum emotion: { happy: 0, angry: 1, sad: 2, fun: 3}

  def start_time
    self.created_at
  end

end
