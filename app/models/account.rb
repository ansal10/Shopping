class Account < ActiveRecord::Base
	belongs_to :profile
	belongs_to :item
end
