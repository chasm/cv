Registrant.destroy_all
User.destroy_all

Registrant.create([
  {
    id: SecureRandom.urlsafe_base64,
    email: "BOB@munat.com"
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "Sam@munat.com"
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "tina@MUNAT.com"
  }
])

User.create([
  {
    id: SecureRandom.urlsafe_base64,
    name: "Tommy Tutone",
    email: "tommy@munat.com",
    phone: "202.5555.4444",
    objective: "To obtain work in a highly-paid sinecure somewhere in the entertainment or food and beverage industries.",
    address: [
      "123 Rocker Road",
      "Punkville, Texas 00666",
      "U.S.A."
    ],
    schools: [
      School.new(
        id: SecureRandom.urlsafe_base64,
        name: "Watson Elementary School",
        started_on: Date.new(1987,9),
        left_on: Date.new(1999,5),
        address: [
  				"221B Baker Street",
  				"London, England"
        ],
        highest_grade_completed: "4th",
  			graduated: false
      ),
      School.new(
        id: SecureRandom.urlsafe_base64,
        name: "Vince Lombardi High School",
        started_on: Date.new(1999,9),
        left_on: Date.new(2005,5),
        address: [
  				"4 Ramones Road",
  				"Hollywood, California 90210"
        ],
        highest_grade_completed: "9th",
  			graduated: false,
  			awards: [ "Most Likely to Fail" ]
      ),
      School.new(
        id: SecureRandom.urlsafe_base64,
        name: "Faber College",
        started_on: Date.new(2005,9),
        left_on: Date.new(2011,5),
        address: [
  				"99 Delta House Drive",
  				"Belushi, New Hampshire 00001"
        ],
        highest_grade_completed: "None",
  			graduated: false,
  			activities: [ "Delta Tau Chi pledge" ]
      )
    ],
    jobs: [
      Job.new(
        id: SecureRandom.urlsafe_base64,
        position: "Product Tester",
        company: "Wonka Industries",
        started_on: Date.new(2011,6),
        left_on: Date.new(2011,7),
        address: [
          "7 Willy Woods",
          "Hershey, Pennsylvania 55555"
        ],
        duties: [
          "Hiding from the boss",
          "Pilfering company property",
          "Drunken singing in the bathrooms",
          "Skirt chasing in the secretary pool",
          "Surfing porn sites"
        ],
        reason_for_leaving: "Unexplained bathroom incident"
      ),
      Job.new(
        id: SecureRandom.urlsafe_base64,
        position: "Fluffer",
        company: "Wanker Industries",
        started_on: Date.new(2011,6),
        address: [
          "12 Willy Woods",
          "Hershey, Pennsylvania 55555"
        ],
        duties: [
          "Would rather not say"
        ]
      )
    ],
    skills: [
      "Able to avoid work even when the boss is watching",
      "Known to offend co-workers with off-color jokes",
      "Often late and regularly leaves early or doesn't show up at all",
      "Likes to play practical jokes, often with expensive consequences"
    ],
    references: [
      Reference.new(
        id: SecureRandom.urlsafe_base64,
        name: "Mick Jagger",
        email: "mick@therollingstones.com"
      ),
      Reference.new(
        id: SecureRandom.urlsafe_base64,
        name: "David Bowie",
        email: "starman@ziggy.com"
      ),
      Reference.new(
        id: SecureRandom.urlsafe_base64,
        name: "Tom Waits",
        email: "tom@waits.for.no.one.com"
      )
    ],
    password: "123",
    password_confirmation: "123"
  }
])

