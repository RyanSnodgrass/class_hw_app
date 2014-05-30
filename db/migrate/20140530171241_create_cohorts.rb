class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string  :track
      t.integer :location_id
      t.date    :start_date
      t.date    :end_date
    end
  end
end
