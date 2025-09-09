class Item < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items
  has_many :packing_lists, through: :packing_list_items

  CATEGORIES = %w[ "clothing", "shoes", "accessories", "toiletries", "electronics", "documents", "misc" ]

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
