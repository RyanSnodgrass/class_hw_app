class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :email
	validates_uniqueness_of :email
	has_many :submissions
	# has_many :cohorts, through: :enrollments
	belongs_to :cohorts

	ROLES = %w[student teacher admin]
	
end