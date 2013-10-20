class Award
  include Mongoid::Document
  
  embedded_in :user
  
  field :id, type: String
  field :name, type: String
  field :awarded_on, type: Date
  
  validates :name, presence: { message: "Award name can't be blank." }
end