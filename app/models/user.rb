require 'securerandom'
class User < ApplicationRecord
    has_many :games, dependent: :delete_all
    has_many :comments, dependent: :delete_all
    has_many :commented_games, through: :comments, source: :game

    has_secure_password
    # has_many :resourzes, through: :comments
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email

    def self.find_with_omniauth(auth)
        # binding.irb
        self.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(12)
        end
    end
end
