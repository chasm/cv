class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps

  before_validation :downcase_email
  before_create :set_id
  before_save :set_expiration
  
  field :id, type: String
  field :email, type: String
  field :expires_at, type: Time

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  
  private

  def downcase_email
    self.email.downcase!
  end
  
  def set_id
    self.id = SecureRandom.urlsafe_base64
  end
  
  def set_expiration
    self.expires_at = Time.now + 4.hours
  end
end