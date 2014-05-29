class UsersController < ApplicationController

	skip_filter :ensure_logged_in, only: [:new, :create, :destroy, :delete]
	def create
		@new_user = User.new(user_params)
		if @new_user.save!

			render "/", notice: "You signed up!"
		else
			redirect_to "/", notice: "Error, something happened"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
	
end