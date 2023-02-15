class Room < ApplicationRecord
  validates :roomname, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, optional: true
  has_one :reservation
  has_many :reservations

  # scopeで検索条件を設定する
  scope :in_area, ->(area) { where("address LIKE ?", "%#{area}%") }
  scope :search, ->(query) { where("roomname LIKE :query OR description LIKE :query", query: "%#{query}%") }
end
