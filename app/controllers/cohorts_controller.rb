class CohortsController < ApplicationController
	def index
		@cohorts = Cohort.all
	end
	def show
		@cohort = Cohort.find(params[:id])
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
	def cohort_params
		params.require(:cohort).permit(:track, :location_id, :start_date, :end_date, :password_digest)
	end

end