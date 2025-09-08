class PackingList < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items
  has_many :items, through: :packing_list_items
end
