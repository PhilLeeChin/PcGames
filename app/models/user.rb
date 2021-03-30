require 'securerandom'
class User < ApplicationRecord
    has_many :games
    has_many :comments
    has_many :commented_games, through: :comments, source: :game
    has_many :genres, through: :games

    has_secure_password
    has_many :resourzes, through: :comments
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email

    def self.find_with_omni(auth)
        # binding.pry
        self.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(12)
        end
    end
end
