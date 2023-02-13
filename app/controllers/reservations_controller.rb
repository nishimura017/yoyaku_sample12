class ReservationsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @reservation = Reservation.new(reservation_params)
 
  end

  def create
 
    @room = Room.find(params[:room_id])

    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to root_path, notice:"予約が完了しました。"
    else
      render "new"
    end
  end
  def confirm
  end
  
  private
  
  def reservation_params
    params.permit(:checkin_at, :checkout_at, :person_count, :room_id).merge(user_id: current_user.id)
  end
end
  