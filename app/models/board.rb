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
class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 500 }

  belongs_to :user
end
