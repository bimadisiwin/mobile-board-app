require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'タイトルと本文がある場合、有効であること' do
    board = create(:board)
    board.valid?
    expect(board).to be_valid
  end

  it 'タイトルがない場合、無効であること' do
    board = build_stubbed(:board, title: nil)
    board.valid?
    expect(board.errors[:title]).to include(I18n.t('errors.messages.blank'))
  end

  it '本文がない場合、無効であること' do
    board = build_stubbed(:board, body: nil)
    board.valid?
    expect(board.errors[:body]).to include(I18n.t('errors.messages.blank'))
  end

  it 'タイトルが２０文字以上の場合、無効である' do
    board = build_stubbed(:board, title: 'a' * 21)
    board.valid?
    expect(board).to be_invalid
  end

  it '本文が５００文字以上の場合、無効である' do
    board = build_stubbed(:board, body: 'a' * 501)
    board.valid?
    expect(board).to be_invalid
  end
end
