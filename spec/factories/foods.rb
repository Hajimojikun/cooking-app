FactoryBot.define do
  factory :food do
    name {Faker::Lorem.sentence}
    ways {Faker::Lorem.sentence}
    ingredients {Faker::Lorem.sentence}
    type_of_food_id {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/M_image.jpg'), filename: 'M_image.jpg')
    end
  end
end