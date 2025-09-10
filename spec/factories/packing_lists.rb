FactoryBot.define do
  factory :packing_list do
    name { Faker::Verb.base.capitalize }
    destination { Faker::Address.city }

    association :user
  end
end
