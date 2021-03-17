class User < ApplicationRecord
    has_many :games
    has_many :comments
    has_many :commented_games, through: :comments, source: :game
    has_many :genres, through: :games

    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email

    def self.find_with_omni(auth)
        binding.pry
    end
end
