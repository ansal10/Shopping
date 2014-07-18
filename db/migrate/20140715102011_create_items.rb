class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :name
    	t.string :company
    	t.integer :mrp
    	t.integer :discount
    	t.integer :quantity
    	t.string :image
    	t.timestamps
    end
  end
end
