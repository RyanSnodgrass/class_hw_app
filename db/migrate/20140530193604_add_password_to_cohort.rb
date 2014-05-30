class AddPasswordToCohort < ActiveRecord::Migration
	def change
		add_column :cohorts, :password_digest, :string
	end
end
