# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'ユーザー登録してみる' do
    it "ユーザー登録できるか" do
      expect(FactoryBot.create(:user)).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:user, name: "")).to_not be_valid
    end
  end
end