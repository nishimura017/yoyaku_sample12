class Room < ApplicationRecord
  validates :roomname, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, optional: true
  has_one :reservation
  has_many :reservations

  def self.search(search)
    if search != ""
      Room.where(["room_name LIKE(?) OR introduction LIKE(?) OR address LIKE(?)", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
end
