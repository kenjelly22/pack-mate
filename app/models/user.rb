class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :packing_lists
  has_many :packing_lists_items, through: :packing_lists
end
