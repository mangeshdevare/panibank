class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :father
      t.string :mother
      t.string :mobile_number
      t.string :address
      t.boolean :married
      t.integer :pincode
      t.string :contact_address
      t.string :nationality
      t.date :dob
      
      t.timestamps
    end
  end
end
