class SessionsController < ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create, :destroy]
	# before_filter :path_boundary, only: [:new, :create, :destroy]


	def new
		@new_user = User.new
	end

	def create

		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

		if user
			session[:user_id] = user.id
			redirect_to "/", notice: "logged in"
		else
			flash.now.alert = "invalid email or password"
			render :new
		end

	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path, notice:"you've logged out!"
	end

	def path_boundary
		if current_user
			redirect_to home_path
		end
	end

end