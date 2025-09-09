FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Toothbrush#{n}" }
    category { "toiletries" }
  end
end
