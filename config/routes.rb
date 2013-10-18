Cv::Application.routes.draw do
  
  # Schools
  get "schools/new" => "schools#new"
  
  # Authentication
  get    "login"  => "session#new"
  post   "login"  => "session#create"
  get    "logout" => "session#destroy"
  delete "logout" => "session#destroy"
  
  # User controls
  get  "register/:code" => "user#new", as: :register
  post "register/:code" => "user#create"
  
  get    "profile/edit" => "user#edit"
  put    "profile"      => "user#update"
  patch  "profile"      => "user#update"
  delete "profile"      => "user#destroy"
  
  # Password reset
  post "update_password" => "user#update_password"
  get  "reset/:code"     => "password#edit", as: :reset
  put  "reset/:code"     => "password#update"
  
  # Legal
  get "privacy" => "site#privacy"
  get "terms"   => "site#terms"
  
  # You can have the root of your site routed with "root"
  root 'site#index'
end
