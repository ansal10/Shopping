class Item < ActiveRecord::Base
	validates :name , :presence => true
	validates :mrp , :presence => true , numericality: {only_integer: true, greater_than_or_equal_to: 1}
	validates :discount , :presence =>true , numericality: {only_integer: true, greater_than_or_equal_to: 0 , less_than_or_equal_to: 100}
	validates :company , :presence => true
	validates :quantity , :presence =>true , numericality: {only_integer: true, greater_than_or_equal_to: 0}
	validates :image , :presence => true

	has_many :account
	has_many :pickup
end
