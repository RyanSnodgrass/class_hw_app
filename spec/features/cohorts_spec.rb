require 'rails_helper'
include AuthenticationHelper

feature "hard urling should check validation" do
	scenario "not logged in should take to sign in page" do
		visit '/cohorts'
		expect(current_path).to eq('/users/sign_in')
	end
	scenario "valid admin logged in stays on page" do
		admin =  FactoryGirl.create(:admin)
		login(admin)
		visit "/cohorts"
		expect(current_path).to eq('/cohorts')
	end
	scenario "valid teacher logged in stays on page" do
		teacher = FactoryGirl.create(:teacher)
		login(teacher)
		visit "/cohorts"
		expect(current_path).to eq('/cohorts')
	end
	scenario "valid student logged in stays on page" do
		student = FactoryGirl.create(:student)
		login(student)
		visit "/cohorts"
		expect(current_path).to eq('/cohorts')
	end
end

feature "displays currently signed in email" do
	scenario "logged in as admin" do
		admin = FactoryGirl.create(:admin)
		login(admin)
		visit "/cohorts"
		expect(page).to have_content(admin.email)
	end
	scenario "logged in as teacher" do
		teacher = FactoryGirl.create(:teacher)
		login(teacher)
		visit "/cohorts"
		expect(page).to have_content(teacher.email)
	end
	scenario "logged in as student" do
		student = FactoryGirl.create(:student)
		login(student)
		visit "/cohorts"
		expect(page).to have_content(student.email)
	end
end

feature "checks user for add a cohort button" do
	scenario "logged in as admin" do
		admin = FactoryGirl.create(:admin)
		login(admin)
		visit '/cohorts'
		find_link('Add a Cohort').visible?
	end
	scenario "logged in as teacher" do
		teacher = FactoryGirl.create(:teacher)
		login(teacher)
		visit '/cohorts'
		expect(page).to have_css('div.button.success.disabled')
	end
	scenario "logged in as student" do
		student = FactoryGirl.create(:student)
		login(student)
		visit '/cohorts'
		expect(page).to have_css('div.button.success.disabled')
	end
end
