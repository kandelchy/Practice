# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |index|
  name = Faker::Name.unique.name
  phone = Faker::PhoneNumber.cell_phone
  birth_date = Faker::Date.birthday(18, 65)
  p1 = Person.create(name: name, phone: phone, birth_date: birth_date)
  p1.save!

    rand(1..3).times do
      street = Faker::Address.street_address
      city = Faker::Address.city
      state = Faker::Address.state
      zip = Faker::Address.zip_code
      country = Faker::Address.country
      a1 = Address.new(street: street, city: city, state: state, zip: zip, country: country)
      a1.person_id = p1.id
      a1.save!
    end
end
