# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Institution.create(name: Faker::University.name)
Grant.create(
  grant_number: Faker::Code.isbn,
  grant_title: Faker::Book.title,
  primary_contact: Faker::Name.name,
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.cell_phone,
  institution_id: Institution.first.id
)

require 'csv'
CSV.foreach('lib/assets/checklist.csv', headers: true) do |row|
  Resource.create(
    file_name: Faker::Book.title,
    url: row['url'],
    checksum: row['checksum'],
    grant_id: Grant.first.id
  )
end
