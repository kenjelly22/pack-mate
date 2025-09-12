class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :packing_list_items
  has_many :packing_lists, through: :packing_list_items

  CATEGORIES = %w[clothing shoes accessories toiletries electronics documents misc]

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  scope :generic, -> { where(user_id: nil) }
  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :all_for_user, ->(user) { generic.or(by_user(user)) }
  scope :by_category, ->(category) { where(category: category) }
end
