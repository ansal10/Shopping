class User < ActiveRecord::Base
	EMAIL_REGEX = /[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]/
	validates :username, :presence =>true , :uniqueness =>true , :length => {:in => 3..20}
	validates :email , :presence => true , :uniqueness =>true , :format=>EMAIL_REGEX
	validates :password , :length => {:in => 3..20}
	validates :mobile , :presence => true , :length => {:in =>10..10}

	has_many :profile
	has_many :pickup
end
