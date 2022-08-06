FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category  { Category.all.sample }
    condition { Condition.all.sample }
    shippingfee { Shippingfee.all.sample }
    prefecture { Prefecture.all.sample }
    delivery_day { DeliveryDay.all.sample }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
