class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :packing_list_items
  has_many :packing_lists, through: :packing_list_items
end
