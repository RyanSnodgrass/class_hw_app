class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.text :description
      t.date :due_date
      t.integer :cohort_id
    end
  end
end
