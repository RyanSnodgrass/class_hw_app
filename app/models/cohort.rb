class Cohort < ActiveRecord::Base

	has_secure_password
	belongs_to :location
	has_many :assignments
	# has_many :users, through: :enrollments
	has_many :users
	belongs_to :track

end