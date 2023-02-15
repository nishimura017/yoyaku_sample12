class AddCalcPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :calc_price, :integer
  end
end
