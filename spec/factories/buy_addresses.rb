FactoryBot.define do
  factory :buy_address do
    token  {"tok_abcdefghijk00000000000000000"}
    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    shipping_address_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    building_name { Faker::Company.name }
    telephone { Faker::Number.leading_zero_number(digits: 11) }
    user_id {Faker::Number.between( from:1, to:100) }
    item_id {Faker::Number.between( from:1, to:100) } 
  end
end
