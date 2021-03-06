FactoryBot.define do
  factory :grant do
    grant_number { Faker::Code.isbn }
    grant_title { Faker::Book.title}
    primary_contact { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    institution
  end

end
