class AddAddressToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :address, :string
    add_column :rooms, :room_image, :string
  end
end
