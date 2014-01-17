JlhsMlk::Application.routes.draw do
  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'dashboard' => "dashboard#index", :as => 'dashboard'
  match 'admin' => 'dashboard#admin', :as => "admin"
  match 'admin/post_school' => 'dashboard#post_school', :as => "post_school"
  match 'admin/delete_school/:id' => 'dashboard#delete_school', :as => "delete_school"
  match 'admin/edit_school/:id' => 'dashboard#edit_school', :as => "edit_school"
  match 'admin/edit_school/:id/post_payment' => 'dashboard#post_payment', :as => "post_payment"
  match 'admin/edit_school/:id/post_payment_mod' => 'dashboard#post_payment_mod', :as => "post_payment_mod"
  match 'admin/edit_school/:id/post_phone_number' => 'dashboard#post_phone_number', :as => "post_phone_number"
  match 'admin/edit_school/:id/post_email' => 'dashboard#post_email', :as => "post_email"
  match 'admin/register_school/:id' => 'dashboard#register_school', :as => "register_school"
  match 'admin/unregister_school/:id' => 'dashboard#unregister_school', :as => "unregister_school"
  match 'admin/delete_payment/school/:school_id/payment/:payment_id' => 'dashboard#delete_payment', :as => "delete_payment"
  match 'admin/delete_payment_mod/school/:school_id/pay_mod/:payment_mod_id' => 'dashboard#delete_payment_modification', :as => 'delete_payment_mod'
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
