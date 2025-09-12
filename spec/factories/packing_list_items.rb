FactoryBot.define do
  factory :packing_list_item do
    status { "packed" }

    association :packing_list
    association :item
  end
end
