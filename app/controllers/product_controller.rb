class ProductController < ApplicationController
  def index
  	@user = session[:username]
    @item = Item.all
  end

  def signup
  	@user=User.new
  end

  def createuser
  	createuser = true
  	@user = User.new(article_params)
  	if @user.save
  		render "index"
  	else 
  		render "signup"
  	end
  end

  def login
  end

  def logout
  	session[:username]=nil
  	session[:name]=nil
  	session[:email]=nil
  	session[:mobile]=nil
  	redirect_to '/product'
  end

  def userlogin
  	#render plain: params[:article].inspect
    @userlogin = ["invalid user"]

  	@user = User.find_by_username(params[:user]["username"])
    if @user.present?
      @userlogin =[]
    end
  	if @user.present? && (@user.password==params[:user]["password"])
  		# render plain: params[:user]["username"]+user.to_s

      session[:id]=@user.id
  		session[:username]=@user.username
  		session[:name]=@user.name
  		session[:email]=@user.email
  		session[:mobile]=@user.mobile
  		redirect_to "/product"
  	else
      @userlogin<<"invalid password"
  		render "login"
  	end
  end

  def addnewelementsform
    @item = Item.new
  end

  def addnewelements
    @item = Item.new(item_params)
    @item.save
    redirect_to "/product/addnewelementsform"
  end

  def productview
    if session[:username] == nil
      redirect_to '/product/login'
    end
    @item = Item.find(params[:id])
  end

  def checkout
    if params[:item] == nil
      redirect_to '/product'
    end
  if params[:item][:quantity].to_i <=0
      session[:errors]=[]
      session[:errors]<<"Please selecat a valid quantity"
      redirect_to "/product/"+params[:itemid]+"/productview"
    end 

    if Item.find(params[:itemid]).quantity < params[:item][:quantity].to_i
      session[:errors]=[]
      session[:errors]<<"quantity Not Available ! enter lesser"
      redirect_to "/product/"+params[:itemid]+"/productview"
    end
     @item = Item.find(params[:itemid])
  end

  def addnewshippingaddress
    item = Item.find(params[:itemid].to_i)
    if item.quantity >= params[:itemquantity].to_i
      item.quantity = item.quantity - params[:itemquantity].to_i
        item.save
      render plain: "Order placed successfully"
    else
      render plain: "Quantity not available !"
    end

  end

  def useraddress
    if params[:id]!=nil
      @profile = User.find(params[:id].to_i).profile.all
    else 
      render plain: "ERROR OCCURRED"
    end
  end

  def confirmselectedaddressajax
    itemquantity = params[:itemquantity].to_i
    userid = session[:id]
    profileid = params[:profileid].to_i
    itemid = params[:itemid].to_i

    item = Item.find(itemid);
    item.quantity = item.quantity - itemquantity;
    if item.save
      Profile.find(profileid).account.create(:item_id=>itemid , :delieverytype=>"Home delievery" , :status=>"In progress" , :quantity=>itemquantity);
      render plain: "successfully done"
    else  
      render "order failed"
    end

  end

  def registeraddressajax
    itemid = params[:itemid].to_i
    itemquantity = params[:itemquantity].to_i
    address = params[:address]
    mobile = params[:mobile].to_i
    pincode = params[:pincode].to_i

    User.find(session[:id].to_i).profile.create(:address=>address , :pincode=>pincode,:mobile=>mobile);
    profileid = Profile.last.id

    item = Item.find(itemid);
    item.quantity = item.quantity - itemquantity;

    if item.save
      Profile.find(profileid).account.create(:item_id=>itemid , :delieverytype=>"Home delievery" , :status=>"In progress" , :quantity=>itemquantity);
      render plain: "successfully done"
    else  
      render "order failed! check the quantity and initials"
    end
  end
  def confirmpickupajax
    itemid = params[:itemid].to_i
    itemquantity = params[:itemquantity].to_i
    address = params[:address]
    mobile = params[:mobile].to_i
    pincode = params[:pincode].to_i

     item = Item.find(itemid);
    item.quantity = item.quantity - itemquantity;

    User.find(session[:id].to_i).pickup.create(:mobile=>mobile , :status=>"Not Yet Pickup" , :address=>address , :pincode=>pincode ,
      :quantity=>itemquantity ,:delieverytype=>"Store Pickup")

    item.pickup = [Pickup.last]
     if item.save
      render plain: "Saved Successfully"
    else 
      render plain: "Error occurred"
    end
  end
  private
		def article_params
			params.require(:user).permit(:name,:username,:mobile,:email,:password)
		end

  private
    def item_params
      params.require(:item).permit(:name,:company,:mrp,:discount,:image,:quantity)
    end
end
