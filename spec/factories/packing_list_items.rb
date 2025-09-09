FactoryBot.define do
  factory :packing_list_item do
    quantity { 2 }
    status { "packed" }

    association :packing_list
    association :item
  end
end
