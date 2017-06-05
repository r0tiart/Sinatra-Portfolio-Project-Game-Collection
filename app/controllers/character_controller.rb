class CharacterController < ApplicationController

	get "/characters" do
		if logged_in?
			@user = current_user
			@characters = @user.characters
			erb :"/characters/characters"
		else
			redirect to "/"	
		end
	end

end