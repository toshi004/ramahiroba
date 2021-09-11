# frozen_string_literal: true

require 'rails_helper'

describe '画面のテスト' do
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面に「新規登録」のボタンがあるか' do
        expect(page).to have_button '新規登録'
      end
      it 'URLが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end
end