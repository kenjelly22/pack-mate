FactoryBot.define do
  factory :packing_list do
    name { "Quest 2025" }
    destination { "Cancun" }

    association :user
  end
end
