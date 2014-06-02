class CohortsController < ApplicationController

	before_action :authenticate_user!
	def index
		@cohorts = Cohort.all
	end
	def show
		@cohort = Cohort.find(params[:id])
		@new_assignment = @cohort.assignments.build
		@assignments = @cohort.assignments
	end

	def add_user_enrollment_cohort
		# @enrollment = Enrollment.new(enrollment_params)
		@cohort = Cohort.find(params[:id])
		# @cohort.reload!

		if 1 < 2 #@cohort.password == params[:password]
			redirect_to :back, notice: "passwords match"
		else
			redirect_to :back, notice: "Something went wrong"
		end
	end
	def new
		@new_cohort = Cohort.new
	end
	def create
		@new_cohort = Cohort.new(cohort_params)
		if @new_cohort.save
			redirect_to cohort_path(@new_cohort)
		else
			redirect_to cohorts_path
		end
	end
	def edit
		@cohort = Cohort.find(params[:id])
	end
	def update
		@cohort = Cohort.find(params[:id])
		if @cohort.update_attributes(cohort_params)
			redirect_to cohort_path(@cohort)
		else
			redirect_to cohorts_path
		end
	end

	def destroy
		@cohort = Cohort.find(params[:id])
		if @cohort.destroy
			redirect_to cohorts_path
		else
			redirect_to cohort_path(@cohort)
		end
	end

	private 

	def cohort_params
		params.require(:cohort).permit(:track, :location_id, :start_date, :end_date, :password)
	end

	def enrollment_params
		params.require(:enrollment).permit(:cohort_id)
	end

end