Rails.application.routes.draw do
  get 'my_account/index'

  get 'product/index' => "product#index"
  get 'product' => "product#index"
  get 'product/signup' => "product#signup"
  post 'product/createuser' => "product#createuser"
  get 'product/login' => "product#login"
  post 'product/userlogin' => "product#userlogin"
  get 'product/userlogin' => "product#login"
  get 'product/userlogin' => "product#login"
  get 'product/logout' => "product#logout"
  get 'product/addnewelementsform' => 'product#addnewelementsform'
  post 'product/addnewelements' => 'product#addnewelements'
  get 'myaccount/index'  => 'myaccount#index'
  get 'myaccount' => 'myaccount#index'

  get 'product/:id/productview' => 'product#productview'

  post 'product/checkout' => 'product#checkout'

  get 'product/checkout' => 'product#index'

  get 'product/addnewshippingaddress' => 'product#addnewshippingaddress'

  get 'product/useraddress' => 'product#useraddress'

  get 'product/confirmselectedaddressajax' => 'product#confirmselectedaddressajax'

  get 'product/registeraddressajax' => 'product#registeraddressajax'

  get 'product/confirmpickupajax' => 'product#confirmpickupajax'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
