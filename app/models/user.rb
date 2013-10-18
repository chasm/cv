class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :schools
  embeds_many :jobs
  embeds_many :honors
  embeds_many :references

  accepts_nested_attributes_for :schools
  accepts_nested_attributes_for :jobs
  accepts_nested_attributes_for :honors
  accepts_nested_attributes_for :references
  
  attr_accessor :password, :password_confirmation
  
  field :id, type: String
  field :name, type: String
  field :address, type: Array
  field :email, type: String
  field :phone, type: String
  field :objective, type: String
  field :skills, type: Array
  
  field :salt, type: String
  field :fish, type: String
  
  field :code, type: String
  field :expires_at, type: Time

  before_validation :downcase_email
  before_create :set_id
  before_save :encrypt_password
  
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    
    return user if user && user.fish == BCrypt::Engine.hash_secret(password, user.salt)
    nil
  end
  
  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def downcase_email
    self.email.downcase!
  end
  
  def set_id
    self.id = SecureRandom.urlsafe_base64
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
      password = nil
    end
  end
end
