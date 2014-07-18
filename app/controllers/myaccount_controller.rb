class MyaccountController < ApplicationController
  def index
  	@profile = Profile.where(:user_id=>session[:id])
  	@account=[]
  	@profile.each do |x|
  		@account << Account.where(:profile_id=>x.id)
  	end

  	@pickup = Pickup.where(:user_id=>session[:id])
  end
end
