# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do
  describe '実際に投稿してみる' do
    let(:user) { FactoryBot.build(:user) }
    let(:post) { FactoryBot.build(:post) }
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "タイトルが空白の場合にエラーメッセージが返ってくるか" do
      post = Post.new(title: '', text: 'test')
      expect(post).to be_invalid
      expect(post.errors[:title]).to include("タイトルを入力してください")
    end
    it "本文が空白の場合にエラーメッセージが返ってくるか" do
      post = Post.new(title: 'test', text: '')
      expect(post).to be_invalid
      expect(post.errors[:text]).to include("本文を入力してください")
    end
  end
end