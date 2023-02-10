class Room < ApplicationRecord
  belongs_to :user

	def self.search(search)
		if search != ""
			Room.where(['room_name LIKE(?) OR introduction LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
		else
			Room.all
		end
	end
end
