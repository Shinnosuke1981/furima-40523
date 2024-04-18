FactoryBot.define do
  factory :item do
    user
    title                          { 'test' }
    item_price                     { 500 }
    shipping_fee_responsibility_id { 2 }
    comment                        { 'いい商品です。' }
    item_category_id               { 2 }
    item_condition_id              { 2 }
    shipping_origin_id             { 2 }
    estimated_shipping_date_id     { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
