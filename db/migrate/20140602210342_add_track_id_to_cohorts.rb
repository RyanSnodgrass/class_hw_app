class AddTrackIdToCohorts < ActiveRecord::Migration
  def change
  	add_column :cohorts, :track_id, :integer
  end
end
