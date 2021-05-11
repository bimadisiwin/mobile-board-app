require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @board = create(:board)
  end

  context 'タイトルと本文が入力された場合' do
    it '掲示板の新規投稿が成功' do
      visit boards_new_path(@board)

      expect(page).to have_field 'タイトル'
      fill_in 'タイトル', with: 'テストのタイトル'
      fill_in '本文', with: 'テストの本文'

      click_button '保存'
      expect(page).to have_content 'テストのタイトル の掲示板を作成しました'
      expect(page).to have_content 'テストのタイトル'
    end
  end

  context 'タイトルが入力されていない場合' do
    it '掲示板の新規投稿が失敗' do
      visit boards_new_path(@board)

      expect(page).to have_field 'タイトル'
      fill_in 'タイトル', with: nil
      fill_in '本文', with: 'テストの本文'

      click_button '保存'
      expect(page).to have_content 'タイトルを入力してください'
    end
  end
end
