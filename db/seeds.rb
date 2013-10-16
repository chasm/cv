Registrant.destroy_all

Registrant.create([
  {
    id: SecureRandom.urlsafe_base64,
    email: "bob@munat.com",
    expires_at: Time.now + 4.hours
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "sam@munat.com",
    expires_at: Time.now + 4.hours
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "tina@munat.com",
    expires_at: Time.now + 4.hours
  }
])