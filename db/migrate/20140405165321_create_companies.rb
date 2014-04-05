class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :companyname
      t.timestamps
    end
  end
end
