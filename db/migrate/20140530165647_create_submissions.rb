class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string   :github_link
      t.string   :heroku_link
      t.integer  :user_id
      t.string   :status
      t.integer  :assignment_id
    end
  end
end
