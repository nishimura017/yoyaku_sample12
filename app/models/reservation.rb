class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true

  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validates :person_count, presence: true, numericality: true
end
