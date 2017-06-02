class Game < ActiveRecord::Base
	has_many :characters
	has_many :user_games
	has_many :users, through: :user_games

	validates :title, presence: true
	validates :genre, presence: true

end