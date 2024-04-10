FactoryBot.define do
  Faker::Config.locale = :ja
  factory :purchase_address do
    post_code { Faker::Base.regexify(/\d{3}-\d{4}/) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building { Faker::Company.name }
    phone_number { Faker::Number.leading_zero_number(digits: rand(10..11)) }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
