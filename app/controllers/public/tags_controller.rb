class Public::TagsController < ApplicationController

  def index
    @teg_list = Tag.all
  end
end
