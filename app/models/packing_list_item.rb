class PackingListItem < ApplicationRecord
  belongs_to :packing_list
  belongs_to :item

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :status, presence: true, inclusion: { in: %w[ packed not_packed ] }
end
