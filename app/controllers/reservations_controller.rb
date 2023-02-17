class ReservationsController < ApplicationController

  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations 
  end

  def new
    @user = current_user
  end

  def confirm
    @reservation = Reservation.new(confirm_reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    @days = (@reservation.checkout_at - @reservation.checkin_at).to_i
    @price = @days * @room.price * @reservation.person_count
    @calc_price = @price
    @reservation.calc_price = @price
    if @days <= 0
        redirect_to @room, alert:"終了日は開始日より後にしてください"
      elsif @reservation.person_count <=0 
        redirect_to @room, alert:"正しい人数を入力してください"
    end
  end

  def create
    @user = current_user
    @reservation = Reservation.new(confirm_reservation_params.merge(room_id: params[:reservation][:room_id]))
    if @reservation.save
      redirect_to root_path, notice:"予約が完了しました。"
    else
      render "confirm"
    end
  end
  
  private

  def confirm_reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count, :room_id, :calc_price).merge(user_id: current_user.id)
  end
  
  def reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count, :room_id, :price).merge(user_id: current_user.id)
  end
  
end
  