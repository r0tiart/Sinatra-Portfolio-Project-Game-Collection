class CharacterController < ApplicationController

	get "/users/:user_slug/:game_slug/characters" do
 		if logged_in?
 			@logged_in = logged_in?
 			@user_profile = User.find_by_slug(params[:user_slug])
			@game = Game.find_by_slug(params[:game_slug])
			@user = current_user
			@characters = @user_profile.characters.select { |character| character.game_id == @game.id}

			erb :"/characters/characters"
		else
			redirect to "/"	
		end
	end

	get "/users/:user_slug/:game_slug/characters/new" do
		@user_profile = User.find_by_slug(params[:user_slug])
		@game = Game.find_by_slug(params[:game_slug])
		@user = current_user

		if logged_in? && @user.id == @user_profile.id
			@logged_in = logged_in?

			if session[:missing] == true 
				session[:missing] = false 
				@missing = true
			end

 			erb :"/characters/create_character"
		else
			redirect to "/"
		end
	end

	post "/users/:user_slug/:game_slug/characters" do 
		params[:character][:level] = params[:character][:level].to_i
		user = User.find_by_slug(params[:user_slug])
		game = Game.find_by_slug(params[:game_slug])
		character = Character.new(params[:character])
		user.characters << character
		game.characters << character

		if user.save
			redirect to "/users/#{user.slug}/#{game.slug}/characters"
		else
			session[:missing] = true
			redirect to "/users/#{user.slug}/#{game.slug}/characters/new"

		end
	end


	get  "/users/:user_slug/:game_slug/characters/:character_slug" do
		if logged_in?
 			@logged_in = logged_in?
 			@user_profile = User.find_by_slug(params[:user_slug])
			@game = Game.find_by_slug(params[:game_slug])
			@user = current_user
			@character = Character.find_by_slug(params[:character_slug])

			erb :"/characters/show_character"
		else
			redirect to "/"	
		end
	end

	get "/users/:user_slug/:game_slug/characters/:character_slug/edit" do 
		@user_profile = User.find_by_slug(params[:user_slug])
		@game = Game.find_by_slug(params[:game_slug])
		@user = current_user
		@character = Character.find_by_slug(params[:character_slug])	

		if logged_in? && @user.id == @user_profile.id
			@logged_in = logged_in?
 			erb :"/characters/edit_character"
		else

			redirect to "/"
		end
	end

	post "/users/:user_slug/:game_slug/characters/:character_slug" do
		@character = Character.find_by_slug(params[:character_slug])

		if params[:character][:name] == "" || params[:character][:level] == ""

			if params[:character][:name] == "" && params[:character][:level] != ""
				@character.level = params[:character][:level]	
				@character.save

			elsif params[:character][:name] != "" && params[:character][:level] == ""
				@character.name = params[:character][:name]
				@character.save
			end
		else	
			@character.name = params[:character][:name]
			@character.level = params[:character][:level]	
			@character.save
		end

		redirect to "/users/#{params[:user_slug]}/#{params[:game_slug]}/characters/#{@character.slug}"
	end
end