Snowite::Application.routes.draw do

  resources :users
  resources :admins
#  get "add_admin" => 'admins#new'
#  post "add_admin" => 'admins#create'

  get "log_in" => 'sessions#new'
  post "log_in" => 'sessions#create'
#  get "sign_up" => 'users#new'
#  post "sign_up" => 'users#create' 
  get "log_out" => 'sessions#destroy'
#  get "user_show/:id" => 'users#show'
#  get "user_show" => 'users#show'
#  get "user_edit" => 'users#edit'
#  post "user_edit" => 'users#update'
#  get "users_list" => 'users#list'

#  delete 'users/:id/del' => 'users#destroy'
#  delete 'admins/:id/del' => 'admins#destroy'


  root :to => "sessions#new"
 # resources :users
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
