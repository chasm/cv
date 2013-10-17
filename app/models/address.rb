class Address
  include Mongoid::Document
  
  embedded_in :user
  embedded_in :school
  embedded_in :job
  
  field :id, type: String
  field :lines, type: Array
end