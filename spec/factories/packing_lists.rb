FactoryBot.define do
  factory :packing_list do
    name { Faker::Verb.base.capitalize }
    destination { Faker::Address.city }
    trip_date { 1.month.from_now }

    association :user
  end
end
