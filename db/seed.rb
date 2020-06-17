require_relative "../config/initializers/environment"
require_relative "../app/models/user"

puts "Create user for Administrator"

User.create(
  id: 1337,
  teamname: "SlashRoot Administrator",
  username: "_kang_konci_03",
  password: "_03__kang_root",
  password_confirmation: "_03__kang_root",
  is_admin: true
)

puts "Create user is done"
