class Tag < ApplicationRecord

  before_save :downcase_tag_name

  has_many :tagmaps, dependent: :destroy
  has_many :posts, through: :tagmaps

  def downcase_tag_name
      self.tag_name.downcase!
  end

end
