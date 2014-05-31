class AssignmentsController < ApplicationController
	def create
		@new_assignment = Assignment.new(assignment_params)
		if @new_assignment.save
			redirect_to cohort_path(@new_assignment.cohort_id)
		else
			redirect_to :back
		end
	end
	def update
	end

	private

	def assignment_params
		params.require(:assignment).permit(:assignment_name, :description, :due_date, :cohort_id)
	end

end