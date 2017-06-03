class UserController < ApplicationController

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
		user = User.find_by(username: params[:user][:username])


		if !user #if user does not exist - create new user else the user = the found user, username must be unique.
			user = User.new(params[:user])
			user.save
			session[:user_id] = user.id
			redirect to "/users/#{user.slug}"
		else
			session[:exist] = true
			redirect to "/users/new"
		end

		
	end

	get "/users/:slug" do 
		if logged_in?
			@logged_in = logged_in?
			@user = current_user
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
			erb :"users/login"
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
end