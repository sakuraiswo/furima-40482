FactoryBot.define do
  Faker::Config.locale = :ja
  factory :item do
    item_name { Faker::Team.creature }
    introduction { Faker::Lorem.sentence(word_count: 10) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_burden_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    number_of_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
