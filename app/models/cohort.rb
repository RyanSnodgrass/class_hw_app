class Cohort < ActiveRecord::Base
	include BCrypt
	has_secure_password
	belongs_to :location
	has_many :assignments
	has_many :users, through: :enrollments

end