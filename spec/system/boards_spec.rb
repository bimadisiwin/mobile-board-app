require 'rails_helper'

RSpec.describe 'Boards', type: :system do
  context 'タイトルと本文が入力された場合' do
    it '掲示板の新規投稿が成功' do
      visit new_board_path
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
      visit new_board_path
      expect(page).to have_field 'タイトル'
      fill_in 'タイトル', with: nil
      fill_in '本文', with: 'テストの本文'
      click_button '保存'
      expect(page).to have_content 'タイトルを入力してください'
    end
  end

  context '掲示板一覧から画面遷移する場合' do
    before do
      create(:board)
    end

    it '新規作成画面に遷移できる' do
      visit boards_path
      expect(page).to have_content '掲示板'
      expect(page).to have_link '新規作成'
      click_on '新規作成'
      expect(page).to have_content '新規追加'
    end

    it '掲示板詳細画面に遷移できる' do
      visit boards_path
      expect(page).to have_content '掲示板'
      expect(page).to have_link '詳細'
      click_link '詳細'
      expect(page).to have_content '掲示板詳細'
    end
  end

  context '掲示板に投稿がある場合' do
    before do
      create(:board)
    end

    it '投稿を編集できる' do
      visit boards_path
      expect(page).to have_content '掲示板'
      expect(page).to have_link '詳細'
      click_link '詳細'
      expect(page).to have_content '掲示板詳細'
      expect(page).to have_link '編集'
      click_on '編集'
      fill_in 'タイトル', with: '編集されたタイトル'
      fill_in '本文', with: 'テストの本文を編集'
      click_on'保存'
      expect(page).to have_content '編集されたタイトル の掲示板を編集しました'
      expect(page).to have_content 'テストの本文を編集'
    end

    xit '掲示板詳細画面に遷移できる' do
      visit boards_path
      expect(page).to have_content '掲示板'
      expect(page).to have_link '詳細'
      click_link '詳細'
      expect(page).to have_content '掲示板詳細'
    end
  end
end
