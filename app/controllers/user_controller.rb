class UserController < ApplicationController

	get '/users/new' do 

		erb :'/users/create_user'
	end


	post '/users' do 
			
		 user = User.new(params[:user])
		 user.save
	end
end