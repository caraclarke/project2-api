Rails.application.routes.draw do

  post '/users' => 'users#create'
  post '/login' => 'users#login'
  post '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  # resources :users, except: [:show, :index]

  post '/profiles' => 'profiles#create'
  get '/profiles/:id' => 'profiles#show'
  get '/profiles/:profile_id/projects' => 'projects#profile_index'
  post '/profiles/:id' => 'profiles#update'
  delete '/profiles/:id' => 'profiles#destroy'

  # resources :profiles

  post '/projects' => 'projects#create'
  get '/projects/:id' => 'projects#show'
  get '/projects' => 'projects#index'
  post '/projects/:id' => 'projects#update'
  delete '/projects/:id' => 'projects#destroy'
  # get 'projects/:email' => 'projects#find_by_email'

  # resources :projects

  resources :user do
    resources :profiles
  end

  resources :profiles do
    resources :projects
  end

  # post '/workshops' => 'workshops#create'
  # get '/workshops/:id' => 'workshops#show'
  # get '/workshops' => 'workshops#index'
  # patch '/workshops/:id' => 'workshops#update'
  # delete '/workshops/:id' => 'workshops#destroy'

  # resources :workshops

  # post '/attendances' => 'attendances#create'
  # get '/attendances/:id' => 'attendances#show'
  # get '/attendances' => 'attendances#index'
  # patch '/attendances/:id' => 'attendances#update'
  # delete '/attendances/:id' => 'attendances#destroy'

  # resources :attendances

  # resources :workshops do
  #   resources :attendances
  # end


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
