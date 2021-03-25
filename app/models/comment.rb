class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :content, presence: true
  validates :user_id, presence: true
  validates :game_id, presence: true
end
