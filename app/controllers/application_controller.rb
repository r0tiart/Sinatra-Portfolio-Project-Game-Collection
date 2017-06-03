require './config/environment'


class ApplicationController < Sinatra::Base
	configure do
    # set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
	set :session_secret, "super_secret_sauce"
	end

	get '/' do 
		if logged_in?
			@logged_in = logged_in?
			@user = current_user
		end
		erb :index
	end

 helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end	