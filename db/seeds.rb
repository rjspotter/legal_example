# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plan = Plan.create(country: 'US',
                   currency: 'USD',
                   price_hundredths: 10000,
                   name: "Simple Plan",
                   description: "Some Cow Funk"
                  )

3.times do |i|
  Benefit.create(name: Faker::Company.unique.name,
                 description: Faker::Hacker.say_something_smart,
                 plans: [plan])
end
