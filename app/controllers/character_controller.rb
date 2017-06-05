class CharacterController < ApplicationController

	get "/users/:slug/characters" do
 		if logged_in?
 			@logged_in = logged_in?
			@game = Game.find_by_slug(params[:slug])
			@user = current_user
			@characters = @user.characters.select { |character| character.game_id == @game.id}

			erb :"/characters/characters"
		else
			redirect to "/"	
		end
	end

end