class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :challenge
      t.references :user
      t.references :action, polymorphic: true
      t.integer :points
      t.timestamps
    end
  end
end
