require 'faker'

Request.destroy_all
Administrator.destroy_all

Administrator.create(email: "admin@example.com", password: "azerty", first_name: "Admin", last_name: "User")

# number = "06123654"

puts 'Creating 2 unconfirmed requests...'
2.times do
  request = Request.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: "0#{rand.to_s[2..10]}",
        email: Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    )
  request.save!
end

puts 'Creating 6 confirmed requests...'
1.times do
    request = Request.new(
    first_name:    Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
    email:  Faker::Internet.email,
    biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    status: 1,
    email_confirmed: true,
    email_confirmation_date: 2.month.ago
)
    request.save!
end
1.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        status: 1,
        email_confirmed: true,
        email_confirmation_date: 3.month.ago
    )
    request.save!
end
2.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        status: 1,
        email_confirmed: true,
        email_confirmation_date: 5.month.ago,
        reconfirmation_date: 2.month.ago
    )
    request.save!
end
2.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        status: 1,
        email_confirmed: true,
        email_confirmation_date: 6.month.ago,
        reconfirmation_date: 3.month.ago
    )
    request.save!
end
puts 'Creating 2 accepted requests...'
1.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        status: 2,
        email_confirmed: true,
        email_confirmation_date: 4.month.ago,
        reconfirmation_date: 1.month.ago,
        accepted_at: 1.week.ago
    )
    request.save!
end
puts 'Creating 2 expired requests...'
2.times do
    request = Request.new(
        first_name:    Faker::Name.first_name,
        last_name:    Faker::Name.last_name,
    phone_number: "0#{rand.to_s[2..10]}",
        email:  Faker::Internet.email,
        biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        status: 3,
        email_confirmed: true,
        email_confirmation_date: 6.month.ago
    )
    request.save!
end

puts 'Finished!'