class EnrollmentsController < ApplicationController

	def create
		@enrollment = Enrollment.new(enrollment_params)
		@cohort = Cohort.find(params[:id])
		# @cohort.reload!
		debugger
		if 1 < 2 #@cohort.secret_token == params[:password]
			redirect_to :back, notice: "passwords match"
		else
			redirect_to :back, notice: "Something went wrong"
		end
	end

	private

	def enrollment_params
		params.require(:enrollment).permit(:cohort_id, :user_id)
	end

end