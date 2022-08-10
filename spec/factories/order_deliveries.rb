FactoryBot.define do
  factory :order_delivery do
    post_code { '123-4567' }
    prefecture_id { '2' }
    city { '北海道' }
    address { '1-1' }
    building { 'アパート' }
    phone_number { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
