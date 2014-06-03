class DropTrackFromCohorts < ActiveRecord::Migration
  def change
  	remove_column :cohorts, :track
  end
end
