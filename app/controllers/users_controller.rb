class UsersController < ApplicationController

	
	def create
		@new_user = User.new(user_params)
		if @new_user.save

			redirect_to new_session_path, notice: "You signed up!"
		else
			redirect_to "/", notice: "Error, something happened"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :role, :password)
	end
	
end