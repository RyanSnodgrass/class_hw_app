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

	def status_update
		@submission = Submission.find(params[:id])
		@submission.status = params["status"]
		if @submission.save
			redirect_to assignment_path(@submission.assignment_id)
		else
			redirect_to :back
		end
	end

	def update
		@submission = Submission.find(params[:id])
		if @submission.update_attributes(submission_params)
			redirect_to assignment_path(@submission.assignment_id)
		else
			redirect_to :back
		end
	end

	def submission_params
		params.require(:submission).permit(:heroku_link, :github_link, :status, :assignment_id, :user_id, :my_param)
		# params.require(:status).permit(:status)
	end
end