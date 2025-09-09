class PackingListItem < ApplicationRecord
  belongs_to :packing_list
  belongs_to :item

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
