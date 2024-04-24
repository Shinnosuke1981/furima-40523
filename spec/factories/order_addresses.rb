FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_origin_id { 2 }
    city               { 'Test City' }
    street_number      { '1-1' }
    build_name         { 'Test Building' }
    phone_number       { '09012345678' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
