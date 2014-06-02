class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :course
    end
  end
end
