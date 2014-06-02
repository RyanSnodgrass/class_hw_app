class SubmissionsController < ApplicationController
	before_action :authenticate_user!
	def show
		@submission = Submission.find(params[:id])

	end

	def new
		@new_submission = Submission.new
		@assignment = Assignment.find(params["my_param"])
		@cur_user_subs = @assignment.submissions.where('user_id = ?', current_user.id)
		if @cur_user_subs.count == 0
			render "/submissions/new"
		else
			redirect_to :back, notice: "Woah there, you've already submitted an app!"
		end
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

	def destroy
		@submission = Submission.find(params[:id])
		@assignment = Assignment.find(params["my_param"])
		if @submission.destroy
			redirect_to assignment_path(@assignment.id)
		else
			redirect_to :back, notice: 'Error'
		end
	end

	def submission_params
		params.require(:submission).permit(:heroku_link, :github_link, :status, :assignment_id, :user_id, :my_param)
		# params.require(:status).permit(:status)
	end
end