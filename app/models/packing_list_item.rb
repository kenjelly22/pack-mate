class PackingListItem < ApplicationRecord
  belongs_to :packing_list
  belongs_to :item

  validates :status, presence: true, inclusion: { in: %w[ packed not_packed ] }
end
