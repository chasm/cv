class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  before_create :set_id
  before_save :set_expiration
  
  field :id, type: String
  field :email, type: String
  field :expires_at, type: Time
  
  private
  
  def set_id
    self.id = SecureRandom.urlsafe_base64
  end
  
  def set_expiration
    self.expires_at = Time.now + 4.hours
  end
end