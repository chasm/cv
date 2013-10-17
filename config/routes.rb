Cv::Application.routes.draw do
  
  # Authentication
  get    "login"  => "session#new"
  post   "login"  => "session#create"
  get    "logout" => "session#destroy"
  delete "logout" => "session#destroy"
  
  # User controls
  get    "profile/edit" => "user#edit"
  put    "profile"      => "user#update"
  patch  "profile"      => "user#update"
  delete "profile"      => "user#destroy"
  
  get  "register/:code" => "user#new", as: :register
  post "register/:code" => "user#create"
  
  # Password reset
  get "reset/:code" => "password#edit", as: :reset
  put "reset/:code" => "password#update"
  
  # Legal
  get "privacy" => "site#privacy"
  get "terms" => "site#terms"
  
  # You can have the root of your site routed with "root"
  root 'site#index'
end
