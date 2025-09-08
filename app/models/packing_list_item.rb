class PackingListItem < ApplicationRecord
  belongs_to :packing_list
  belongs_to :item
end
