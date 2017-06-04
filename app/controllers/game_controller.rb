class GameController < ApplicationController

	get '/games' do
		@games = Game.all
		if logged_in?
			@logged_in = true
			@user = current_user
		end

		erb :"/games/games"
	end



	get '/games/new' do 
		if logged_in?
			@logged_in = logged_in?
			@user = current_user
			@games = Game.all
			erb :"/games/create_game"
		else
			redirect to "/"
		end
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

	post '/games' do 

		game = Game.find_by(title: params[:game][:title].downcase)
		#if game is found - the publisher/genre can't be changed

		if !game #if game does not exist - create new game else the game = the found game, game must be unique.
			game = Game.new(params[:game])
			game.title = game.title.downcase
			game.publisher = game.publisher.downcase

			current_user.games << game
			current_user.save

		else
			current_user.games << game
			current_user.save
		end

		redirect to "/games/#{game.slug}"
	end
end
