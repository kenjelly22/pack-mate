class PackingList < ApplicationRecord
  belongs_to :user
  has_many :packing_list_items, dependent: :destroy
  has_many :items, through: :packing_list_items

  validates :name, uniqueness: { scope: :user_id }, presence: true
  validates :destination, presence: true
  validates :trip_date, presence: true

  validate :trip_date_cannot_be_in_the_past

  scope :past_dates, -> { where(trip_date: ..Date.yesterday) }
  scope :future_dates, -> { where(trip_date: Date.today..) }

  def trip_date_cannot_be_in_the_past
    if trip_date && trip_date < Date.yesterday
      errors.add(:trip_date, "can't be in the past")
    end
  end
end
