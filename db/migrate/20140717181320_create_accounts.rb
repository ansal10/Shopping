class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.integer :user_id
    	t.integer :profile_id
    	t.integer :item_id
    	t.string :delieverytype
    	t.string :status
    	t.integer :quantity

      t.timestamps
    end
  end
end
