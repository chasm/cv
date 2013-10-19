Cv::Application.routes.draw do
  
  # Authentication
  get    "login"  => "session#new"
  post   "login"  => "session#create"
  get    "logout" => "session#destroy"
  delete "logout" => "session#destroy"
  
  # User controls
  get  "register/:code" => "registration#new", as: :register
  post "register/:code" => "registration#create"
  
  get    "profile"      => "profile#show"
  put    "profile"      => "profile#update"
  patch  "profile"      => "profile#update", defaults: { format: :json }
  delete "profile"      => "profile#destroy"
  
  # Public CV
  get "cv/:id" => "profile#show"
  
  # CV API
  scope :api do
    get   "uuids"      => "user#uuids", defaults: { format: :json }
    get   "uuids/:num" => "user#uuids", defaults: { format: :json }
    get   "user"       => "user#show", defaults: { format: :json }
    put   "user"       => "user#update", defaults: { format: :json }
    patch "user"       => "user#update", defaults: { format: :json }
    
    resources :awards, only: [ :update, :destroy ], defaults: { format: :json }
    resources :jobs, only: [ :update, :destroy ], defaults: { format: :json }
    resources :references, only: [ :update, :destroy ], defaults: { format: :json }
    resources :schools, only: [ :update, :destroy ], defaults: { format: :json }
  end
  
  # Password reset
  post "update_password" => "profile#update_password"
  get  "reset/:code"     => "password#edit", as: :reset
  put  "reset/:code"     => "password#update"
  
  # Legal
  get "privacy" => "site#privacy"
  get "terms"   => "site#terms"
  
  # You can have the root of your site routed with "root"
  root 'site#index'
end
