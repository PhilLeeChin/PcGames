class Game < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :users, through: :comments

  validates :title, length: { in: 5..75 }
end
