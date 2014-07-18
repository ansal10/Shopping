class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :address
      t.integer :pincode
      t.integer :mobile
       
      t.timestamps
    end
  end
end
