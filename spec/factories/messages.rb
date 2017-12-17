FactoryBot.define do
  factory :message do
    title { Faker::Lorem.word }
    body { Faker::Lorem.words(20) }
    is_read false
    is_archived false
    sender_id 1
    recipient_id 1
  end
end
