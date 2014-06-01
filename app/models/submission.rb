class Submission < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :user
	# def show
	# 	@submission = Submission.find(params[:id])
	# end
end