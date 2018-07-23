# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

us = Country.create(id: 'US',
                    currency: 'USD')

3.times do |i|
  Benefit.create(name: Faker::Company.unique.name,
                 description: Faker::Hacker.say_something_smart)
end

simple_plan = Plan.create(country: us,
                          price_hundredths: 10000,
                          name: "Simple Plan",
                          description: "Some Cow Funk",
                          benefits: Benefit.all
                         )

ca = Country.create(id: 'CA',
                    currency: 'CAD')

2.times do |i|
  Benefit.create(name: Faker::Company.unique.name,
                 description: Faker::Hacker.say_something_smart)
end


north_plan = Plan.create(country: ca,
                         price_hundredths: 5097,
                         name: "North Plan",
                         description: "Some Cow Funk Eh?",
                         benefits: Benefit.all.slice(2, 2)
                        )

au = Country.create(id: 'AU',
                    currency: 'AUD')

2.times do |i|
  Benefit.create(name: Faker::Company.unique.name,
                 description: Faker::Hacker.say_something_smart)
end


south_plan = Plan.create(country: au,
                         price_hundredths: 5097,
                         name: "South Plan",
                         description: "Some Cow Funk on the barby",
                         benefits: Benefit.all.slice(2, 4)
                        )

complex_plan = Plan.create(country: us,
                           price_hundredths: 99999,
                           name: "Complex Plan",
                           description: "Change is neither good nor bad",
                           benefits: Benefit.all
                          )
