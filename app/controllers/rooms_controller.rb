
class RoomsController < ApplicationController

  
  def index
  @rooms = Room.all

  end

  def show
  
    @room = Room.find(params[:id])
    @reservation = Reservation.new(room_id: @room.id)

  
    
  end


  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to @room, notice: '宿泊施設を登録しました'
    else
      flash[:alert] = "必須項目に入力してください"
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room, notice: '宿泊施設情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, notice: '宿泊施設を削除しました'
  end

  def in_area
    @rooms = Room.in_area(params[:area])
  end

  def search
    @rooms = Room.search(params[:query])
  end

  def result
    @rooms = Room.all
    @rooms = @rooms.in_area(params[:area]) if params[:area].present?
    @rooms = @rooms.search(params[:query]) if params[:query].present?
    @count = @rooms.count
  end


    private

  def confirm_room_params
    params.require(:room).permit(:checkin_at, :checkout_at, :person_count, :room_id, :calc_price, :room_image).merge(user_id: current_user.id)
  end

  def room_params
    params.require(:room).permit(:roomname, :description, :price, :address, :room_image, :user_id)
  end

end
      

