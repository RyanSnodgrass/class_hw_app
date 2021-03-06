class AssignmentsController < ApplicationController
	before_action :authenticate_user!
	def show
		@assignment = Assignment.find(params[:id])
		@cohort = Cohort.find(@assignment.cohort_id)
		# @submissions = @assignment.submissions
		# @new_comment = Comment.new
	end
	def create
		@new_assignment = Assignment.new(assignment_params)
		if @new_assignment.save
			redirect_to cohort_path(@new_assignment.cohort_id)
		else
			redirect_to :back
		end
	end

	def edit
		@assignment = Assignment.find(params[:id])
		@cohort = Cohort.find(@assignment.cohort_id)
	end
	def update
		@assignment = Assignment.find(params[:id])
		if @assignment.update_attributes(assignment_params)
			redirect_to assignment_path(@assignment.id)
		else
			redirect_to edit_assignment_path(@assignment.id)
		end
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		cohort = @assignment.cohort_id
		if @assignment.destroy
			redirect_to cohort_path(cohort)
		else
			redirect_to :back
		end
	end

	private

	def assignment_params
		params.require(:assignment).permit(:assignment_name, :description, :due_date, :cohort_id)
	end

end