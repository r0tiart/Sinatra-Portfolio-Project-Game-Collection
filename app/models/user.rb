class User < ActiveRecord::Base
	has_many :characters
	has_many :user_games
	has_many :games, through: :user_games

	has_secure_password
	validates :username, presence: true
	validates :email, presence: true
end