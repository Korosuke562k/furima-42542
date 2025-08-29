FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    text                { Faker::Lorem.sentence }
    amount              { Faker::Number.between(from: 300, to: 100_000) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    status_id           { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id     { Faker::Number.between(from: 2, to: 2) }
    shipping_address_id { Faker::Number.between(from: 2, to: 47) }
    shipping_days_id    { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
