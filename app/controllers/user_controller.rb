class UserController < ApplicationController

	get '/users' do 
		if logged_in?
			@logged_in = logged_in?
			@user = current_user
			@users = User.all
			erb :"/users/users"
		else
			redirect to "/"
		end
	end

	get '/users/new' do 
		if logged_in?
			user = current_user
			redirect to "/users/#{user.slug}"
		else	

			if session[:exist] == true
				session[:exist] = false
				@exist = true
			end

			erb :'/users/create_user'
		end
	end


	post '/users' do 
		user = User.find_by(username: params[:user][:username].downcase)


		if !user #if user does not exist - create new user else the user = the found user, username must be unique.
			user = User.new(params[:user])
			user.username = user.username.downcase
			user.save
			session[:user_id] = user.id
			redirect to "/users/#{user.slug}"
		else
			session[:exist] = true
			redirect to "/users/new"
		end
	end

	get "/users/:slug" do 
		@user_profile = User.find_by_slug(params[:slug])
		if logged_in?
			@logged_in = logged_in?
			@user = current_user
			@same_user = true if @user_profile == @user


			erb :"/users/show_user"
		else
			redirect to "/"
		end
	end

	get "/login" do 
		if logged_in?
			user = current_user
			redirect to "/users/#{user.slug}"
		else	

			if session[:valid?] == false
				@valid = false
				session[:valid?] = true
			end
			erb :"/users/login"
		end
	end

	post "/login" do 

		user = User.find_by(username: params[:username])


		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/users/#{user.slug}"
		else
			session[:valid?] = false
			redirect to "/login"
		end
	end

	get "/logout" do 
		session.clear

		redirect to "/"
	end

	post "/delete" do 
		user = User.find(session[:user_id])
		game = Game.find(params[:game_id])
		user.games.delete(game)
		user.save
		redirect to "/users/#{user.slug}"
	end
end