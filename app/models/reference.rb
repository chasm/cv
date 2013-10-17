class Reference
  include Mongoid::Document
  
  embedded_in :user
  
  field :id, type: String
  field :name, type: String
  field :phone, type: String
  field :email, type: String
end