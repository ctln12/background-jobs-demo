puts 'Cleaning database...'
puts '  Destroying users...'
User.destroy_all
puts "#{User.count} users"
puts 'Cleaning done!'

puts 'Creating 5 users...'
puts '  1 admin user...'
User.create!(email: 'cactus@gmail.com', password: '123456', admin: true)
puts '  4 regular users...'
emails = ['alice@gmail.com', 'bob@gmail.com', 'john@gmail.com', 'jane@gmail.com']
emails.each do |email|
  User.create!(email: email, password: '123456', admin: false, credit: rand(3..8))
end
puts "Created #{User.count} users!"

puts 'Seeding finished!'
