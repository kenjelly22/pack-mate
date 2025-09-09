FactoryBot.define do
  factory :packing_list do
    name { "Quest 2025" }
    destination { "Cancun" }
    start_date { Date.current }

    association :user
  end
end
