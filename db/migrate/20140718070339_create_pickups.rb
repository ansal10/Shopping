class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.integer :user_id
      t.integer :mobile
      t.integer :pincode
      t.string :status
      t.integer :item_id
      t.integer :quantity
      t.string :address
      t.string :delieverytype
      t.timestamps
    end
  end
end
