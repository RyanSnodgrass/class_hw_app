FactoryGirl.define do
	factory :admin, class: User do
		email "sarah.lodato@admin.com"
		password "password"
		password_confirmation "password"
		role "admin"
		first_name "Sarah"
		last_name "Lodato"
	end
	factory :teacher, class: User do
		email "shelby.scwitzer@teacher.com"
		password "password"
		password_confirmation "password"
		role "teacher"
		first_name "Shelby"
		last_name "Schwitzer"
	end
	factory :student, class: User do
		email "ryan.snodgrass@student.com"
		password "password"
		password_confirmation "password"
		role "student"
		first_name "Ryan"
		last_name "Snodgrass"
	end
	# factory(:teacher_user) do
	# 	email "shelby.scwitzer@teacher.com"
	# 	password "password"
	# 	password_confirmation "password"
	# 	role "teacher"
	# 	first_name "Shelby"
	# 	last_name "Scwitzer"
	# end
	# factory(:student_user) do
	# 	email "ryan.snodgrass@student.com"
	# 	password "password"
	# 	password_confirmation "password"
	# 	role "student"
	# 	first_name "Ryan"
	# 	last_name "Snodgrass"
	# end
end
