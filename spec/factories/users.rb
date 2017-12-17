FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'email@email.com'
    password 'password'
  end
end
