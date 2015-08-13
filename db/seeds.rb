# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create!([
  {email: "cara@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "nicki@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "nicolina@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "anthony@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "ceclarke@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "naclarke@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "atclarke@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "thomas@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "tclarke@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""},
  {email: "annec@gmail.com", password: "abc123", password_confirmation: "abc123", token: ""}
])

Profile.create!([
  {surname: "Clarke", given_name: "Cara", location: "Boston, MA", about_me: "Crosshatch user", gender: "F", user_id: 1},
  {surname: "Clarke", given_name: "Nicki", location: "San Francisco, CA", about_me: "Crosshatch user", gender: "F", user_id: 2},
  {surname: "Clarke", given_name: "Nicolina", location: "Walnut Creek, CA", about_me: "Crosshatch user", gender: "F", user_id: 3},
  {surname: "Clarke", given_name: "Anthony", location: "Santa Barbara, CA", about_me: "Crosshatch user", gender: "M", user_id: 10},
  {surname: "Clarke", given_name: "Tony", location: "Walnut Creek, CA", about_me: "Crosshatch user", gender: "M", user_id: 4},
  {surname: "Bonfiglio", given_name: "Victoria", location: "Englewood, NJ", about_me: "Crosshatch user", gender: "F", user_id: 5},
  {surname: "Bonfiglio", given_name: "Ralph", location: "Englewood, NJ", about_me: "Crosshatch user", gender: "M", user_id: 6},
  {surname: "Bonfiglio", given_name: "Allison", location: "Middletown, NJ", about_me: "Crosshatch user", gender: "F", user_id: 7},
  {surname: "Bonfiglio", given_name: "Alexandra", location: "Austin, TX", about_me: "Crosshatch user", gender: "F", user_id: 8},
  {surname: "Bonfiglio", given_name: "Natalie", location: "Fort Collins, CO", about_me: "Crosshatch user", gender: "F", user_id: 9}
])

Project.create!([
  {title: "Knit Yourself Gloves!", instructions: "1. Know How to knit", profile_id: 1},
  {title: "Cactus Pillow", instructions: "1. Know how to sew. 2. Know what a cactus looks like", profile_id: 2},
  {title: "Make a pillow of your state", instructions: "1. Know how to sew. 2. Know what your state looks like", profile_id: 3},
  {title: "Picture Frame Decoration", instructions: "1. Buy some glue and glitter. 2. Glitter it up.", profile_id: 4},
  {title: "Knit Simple Scarf", instructions: "1. Know How to knit", profile_id: 5},
  {title: "Knit Infinity Scarf", instructions: "1. Know How to knit", profile_id: 6},
  {title: "Create a dress!", instructions: "1. Know how to sew.", profile_id: 7},
  {title: "Embroider a baseball hat", instructions: "1. Know how to Embroider.", profile_id: 8},
  {title: "Decorate a pillow", instructions: "1. Know how to Embroider.", profile_id: 9},
  {title: "Sew/Embroider a pillowcase", instructions: "1. Know how to sew. 2. Know how to Embroider.", profile_id: 10}
])

Workshop.create!([
  {title: "Beginning Knitting", location: "Boston, MA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "Weekly", organizer_id: 1},
  {title: "Intro to Crochet", location: "San Francisco, CA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "No", organizer_id: 1},
  {title: "How to make a craft blog", location: "Boston, MA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "Monthly", organizer_id: 3},
  {title: "Sew a simple skirt", location: "Boston, MA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "Weekly", organizer_id: 5},
  {title: "Intermediate Knitting", location: "San Francisco, CA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "No", organizer_id: 2},
  {title: "Advanced Crochet", location: "Boston, MA", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "Monthly", organizer_id: 2},
  {title: "Design with Lace", location: "Fort Collins, CO", about: "A crosshatch workshop", contact_info: "email: phone number: ", repeats: "No", organizer_id: 4}
])

Attendance.create!([
  {date: "2015-12-17", profile_id: 1, workshop_id: 1},
  {date: "2015-12-17", profile_id: 2, workshop_id: 1},
  {date: "2015-12-17", profile_id: 3, workshop_id: 1},
  {date: "2015-12-17", profile_id: 4, workshop_id: 1},
  {date: "2015-12-17", profile_id: 5, workshop_id: 1},
  {date: "2015-12-17", profile_id: 6, workshop_id: 1},
  {date: "2015-12-17", profile_id: 7, workshop_id: 1},
  {date: "2015-12-17", profile_id: 8, workshop_id: 1},
  {date: "2015-12-17", profile_id: 9, workshop_id: 1},
  {date: "2015-02-27", profile_id: 10, workshop_id: 2},
  {date: "2015-02-27", profile_id: 1, workshop_id: 2},
  {date: "2015-02-27", profile_id: 2, workshop_id: 2},
  {date: "2015-02-27", profile_id: 3, workshop_id: 2},
  {date: "2015-02-27", profile_id: 4, workshop_id: 2},
  {date: "2015-04-03", profile_id: 5, workshop_id: 3},
  {date: "2015-04-03", profile_id: 6, workshop_id: 3},
  {date: "2015-04-03", profile_id: 7, workshop_id: 3},
  {date: "2015-04-03", profile_id: 8, workshop_id: 3},
  {date: "2015-04-03", profile_id: 9, workshop_id: 3},
  {date: "2015-04-03", profile_id: 10, workshop_id: 3},
  {date: "2015-04-03", profile_id: 1, workshop_id: 3},
  {date: "2015-04-03", profile_id: 2, workshop_id: 3},
  {date: "2015-04-03", profile_id: 3, workshop_id: 3},
  {date: "2015-03-12", profile_id: 4, workshop_id: 4},
  {date: "2015-03-12", profile_id: 5, workshop_id: 4},
  {date: "2015-03-12", profile_id: 6, workshop_id: 4},
  {date: "2015-03-12", profile_id: 7, workshop_id: 4},
  {date: "2015-03-12", profile_id: 8, workshop_id: 4},
  {date: "2015-07-19", profile_id: 9, workshop_id: 5},
  {date: "2015-07-19", profile_id: 10, workshop_id: 5},
  {date: "2015-07-19", profile_id: 1, workshop_id: 5},
  {date: "2015-07-19", profile_id: 2, workshop_id: 5},
  {date: "2015-07-19", profile_id: 3, workshop_id: 5},
  {date: "2015-07-19", profile_id: 4, workshop_id: 5},
  {date: "2015-07-19", profile_id: 5, workshop_id: 5},
  {date: "2015-12-02", profile_id: 6, workshop_id: 6},
  {date: "2015-12-02", profile_id: 7, workshop_id: 6},
  {date: "2015-12-02", profile_id: 8, workshop_id: 6},
  {date: "2015-12-02", profile_id: 9, workshop_id: 6},
  {date: "2015-12-02", profile_id: 10, workshop_id: 6},
  {date: "2015-12-02", profile_id: 1, workshop_id: 6},
  {date: "2015-12-02", profile_id: 2, workshop_id: 6},
  {date: "2015-12-02", profile_id: 3, workshop_id: 6},
  {date: "2015-12-02", profile_id: 4, workshop_id: 6},
  {date: "2015-12-02", profile_id: 5, workshop_id: 6},
  {date: "2015-12-02", profile_id: 6, workshop_id: 6},
  {date: "2015-12-02", profile_id: 7, workshop_id: 6},
  {date: "2015-11-17", profile_id: 8, workshop_id: 7},
  {date: "2015-11-17", profile_id: 9, workshop_id: 7},
  {date: "2015-11-17", profile_id: 10, workshop_id: 7},
  {date: "2015-11-17", profile_id: 1, workshop_id: 7},
  {date: "2015-11-17", profile_id: 2, workshop_id: 7},
  {date: "2015-11-17", profile_id: 3, workshop_id: 7}
])
