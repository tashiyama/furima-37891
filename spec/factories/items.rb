FactoryBot.define do
  factory :item do
    item_name              { Faker::Team.name }
    item_info              { Faker::Lorem.sentence }
    sales_status_id        { 2 }
    category_id            { 2 }
    shipping_fee_id        { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }
    price                  { 1000 }

    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
