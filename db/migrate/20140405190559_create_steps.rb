class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :challenge
      t.string :title
      t.text :description
      t.text :pledge_description
      t.integer :pledge_points
      t.timestamps
    end
  end
end
