class CreateDataframes < ActiveRecord::Migration
  def change
    create_table :dataframes do |t|
    	t.decimal :value
    	t.references :membership
      t.timestamps
    end
  end
end
