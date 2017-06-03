class GameController < ApplicationController

	get '/games' do
		@games = Game.all
		if logged_in?
			@logged_in = true
			@user = current_user
		end

		erb :"/games/games"
	end
end