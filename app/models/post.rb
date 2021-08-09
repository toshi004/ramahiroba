class Post < ApplicationRecord

  belongs_to :user
  belongs_to :tagmap
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

end
