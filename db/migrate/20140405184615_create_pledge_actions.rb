class CreatePledgeActions < ActiveRecord::Migration
  def change
    create_table :pledge_actions do |t|
      t.references :user
      t.references :step
      t.timestamps
    end
  end
end
