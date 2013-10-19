class Award
  include Mongoid::Document
  
  embedded_in :user
  
  field :id, type: String
  field :name, type: String
  field :awarded_on, type: Date
end