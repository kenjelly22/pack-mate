class Item < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items
  has_many :packing_lists, through: :packing_list_items
end
