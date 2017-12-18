class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :email
      t.string :mobile
      t.string :location
      t.integer :managed_by

      t.timestamps null: false
    end
  end
end
