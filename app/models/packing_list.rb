class PackingList < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items, dependent: :destroy
  has_many :items, through: :packing_list_items

  validates :name, uniqueness: true, presence: true
  validates :destination, presence: true
end
