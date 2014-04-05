class CreateDataActions < ActiveRecord::Migration
  def change
    create_table :data_actions do |t|
      t.references :user
      t.integer :value
      t.timestamps
    end
  end
end
