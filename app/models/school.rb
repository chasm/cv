class School
  include Mongoid::Document
  
  embeds_one :address
  
  field :id, type: String
  field :name, type: String
  field :started_on, type: Date
  field :left_on, type: Date
  field :highest_grade_completed, type: String
  field :graduated, type: Boolean, default: false
  field :awards, type: Array, default: []
  field :activities, type: Array, default: []
end