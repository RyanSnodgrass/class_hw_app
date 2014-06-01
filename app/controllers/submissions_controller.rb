class SubmissionsController < ApplicationController
	def show
		@submission = Submission.find(params[:id])
		
	end

	def new
		@new_submission = Submission.new

		@assignment = Assignment.find(params["my_param"])

	end

	def create
		@new_submission = Submission.new(submission_params)
		if @new_submission.save		 	 	
			redirect_to assignment_path(@new_submission.assignment_id)
	  else
	 	  redirect_to :back
		end
	end

	def submission_params
		params.require(:submission).permit(:heroku_link, :github_link, :assignment_id, :user_id, :my_param)
	end
end