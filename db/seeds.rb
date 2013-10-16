Registrant.destroy_all
User.destroy_all

Registrant.create([
  { email: "BOB@munat.com" },
  { email: "Sam@munat.com" },
  { email: "tina@MUNAT.com" }
])

User.create([
  {
    name: "Tommy Tutone",
    email: "tommy@munat.com",
    password: "123",
    password_confirmation: "123"
  }
])