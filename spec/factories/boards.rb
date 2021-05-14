# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
FactoryBot.define do
  factory :board do
    title { 'テストのタイトル' }
    body { 'テストの本文' }
  end
end
