FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id  { '2' }
    condition_id { '2' }
    shippingfee_id { '2' }
    prefecture_id { '2' }
    delivery_day_id { '2' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
