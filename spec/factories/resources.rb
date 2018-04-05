FactoryBot.define do
  factory :resource do
    file_name { Faker::Book.title }
    url { Faker::Internet.url }
    checksum 'c53b9907999d92eabaf1a2004cac7cb6'
    active true
    access ''
    grant
  end
end
