class UserController < ApplicationController

	get '/users/new' do 

		erb :'/users/create_user'
	end


	post '/users' do 
		user = User.find_by(username: params[:user][:username])


		if !user #if user does not exist - create new user else the user = the found user, username must be unique.
			user = User.new(params[:user])
			user.save
		end

		session[:user_id] = user.id
		redirect to "/user/#{user.slug}"
	end

	get "/user/:slug" do 
		if logged_in?
			@user = current_user
			erb :"/users/show_user"
		else
			redirect to "/"
		end
	end

	get "/login" do 
		erb :"users/login"
	end

	post "/login" do 

		user = User.find_by(username: params[:username])


		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/user/#{user.slug}"
		else
			session[:valid?] = false
			redirect to "/login"
		end
	end
end