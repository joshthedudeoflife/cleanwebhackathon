class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.string :title
    	t.string :description
    	t.datetime :start_date
    	t.datetime :end_date
      t.timestamps
    end
  end
end
