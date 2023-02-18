class AddRoomIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :room, foreign_key: true
  end
end
