class User < ActiveRecord::Base

	validates_presence_of :email
	validates_uniqueness_of :email


	ROLES = %w[student teacher]
	
end