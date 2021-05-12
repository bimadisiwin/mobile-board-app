require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  describe 'GET /index' do
    it 'リクエストが成功すること' do
      get '/boards'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_board_path
      expect(response).to have_http_status(:success)
    end
  end
end
