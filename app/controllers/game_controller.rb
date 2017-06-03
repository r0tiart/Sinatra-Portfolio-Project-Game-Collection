class GameController < ApplicationController

	get '/games' do
		@games = Game.all
		if logged_in?
			@logged_in = true
			@user = current_user
		end

		erb :"/games/games"
	end

	get '/games/:slug' do 
	
		if logged_in?
			@game = Game.find_by_slug(params[:slug])
			@logged_in = logged_in?
			@user = current_user
			erb :"/games/show_game"
		else
			redirect to "/"
		end
	end
end
