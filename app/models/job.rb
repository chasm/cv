class Job
  include Mongoid::Document
  
  embeds_one :address
  embeds_one :supervisor
  
  field :id, type: String
  field :position, type: String
  field :company, type: String
  field :website, type: String
  field :started_on, type: Date
  field :left_on, type: Date
  field :duties, type: Array
  field :reason_for_leaving, type: String
end