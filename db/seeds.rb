# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create an admin user
User.create(name: 'admin')

# Create some cars for the owner
Car.create(
  model: 'Tesla Model S',
  price: 199,
  description: 'The Tesla Model S is an all-electric',
  owner: User.find_by(name: 'admin')
)

Car.create(
  model: 'Tesla Model 3',
  price: 99,
  description: 'The Tesla Model 3 is an all-electric',
  owner: User.find_by(name: 'admin')
)

Car.create(
  model: 'Tesla Model X',
  price: 299,
  description: 'The Tesla Model X is an all-electric',
  owner: User.find_by(name: 'admin')
)

