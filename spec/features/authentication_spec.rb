require 'rails_helper'
include AuthenticationHelper


feature "sign in" do
	let(:admin) {FactoryGirl.create(:admin)}

	scenario "loggin as admin" do 
		login(admin)

	end
end