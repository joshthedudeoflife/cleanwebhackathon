class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
    	t.string :title
    	t.string :description
    	t.datetime :start_date
    	t.datetime :end_date
    	t.string :metric_type
      t.timestamps
    end
  end
end
