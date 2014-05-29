class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :user_type, :string

  end
end
