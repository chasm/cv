class Supervisor
  include Mongoid::Document
  
  embedded_in :job
  
  field :id, type: String
  field :name, type: String
  field :phone, type: String
  field :email, type: String
end