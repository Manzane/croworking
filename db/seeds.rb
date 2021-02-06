require 'faker'

Request.destroy_all

# Administrator.create(email: "admin@example.com", password: "azerty", first_name: "Admin", last_name: "User")

puts 'Creating 10 unconfirmed requests...'
10.times do
  request = Request.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email: Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
  request.save!
end

puts 'Creating 20 confirmed requests...'
# 5.times do
#     request = Request.new(
#         first_name:    Faker::Name.first_name,
#         last_name:    Faker::Name.last_name,
#         phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
#         email:  Faker::Internet.email,
#         biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#         status: 1,
#         email_confirmation_date: 1.week.ago
#     )
#     request.save!
#   end
# 5.times do
# request = Request.new(
#     first_name:    Faker::Name.first_name,
#     last_name:    Faker::Name.last_name,
#     phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
#     email:  Faker::Internet.email,
#     biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#     status: 1,
#     email_confirmation_date: 1.month.ago
# )
# request.save!
# end
5.times do
    request = Request.new(
    first_name:    Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
    email:  Faker::Internet.email,
    biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    status: 1,
    email_confirmation_date: 2.month.ago
)
    request.save!
end
5.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        status: 1,
        email_confirmation_date: 3.month.ago
    )
    request.save!
end
5.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        status: 1,
        email_confirmation_date: 5.month.ago,
        reconfirmation_date: 2.month.ago
    )
    request.save!
end
5.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        status: 1,
        email_confirmation_date: 6.month.ago,
        reconfirmation_date: 3.month.ago
    )
    request.save!
end
puts 'Creating 5 accepted requests...'
5.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        status: 2,
        email_confirmation_date: 4.month.ago,
        reconfirmation_date: 1.month.ago
    )
    request.save!
end
puts 'Creating 5 expired requests...'
5.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
        phone_number: rand(10 ** 10).to_s.rjust(10,'0'),
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        status: 3,
        email_confirmation_date: 6.month.ago
    )
    request.save!
end

puts 'Finished!'