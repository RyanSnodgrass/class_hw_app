class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :cohort_id
      t.integer :user_id
    end
  end
end
