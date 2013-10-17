class Honor
  include Mongoid::Document
  
  embedded_in :user
  
  field :id, type: String
  field :award, type: String
  field :awarded_on, type: Date
end