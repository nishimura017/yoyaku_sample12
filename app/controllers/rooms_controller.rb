
class RoomsController < ApplicationController
def index
  @rooms = current_user.rooms
  @rooms = Room.all
end

def show
  @room = Room.find(params[:id])
  @rooms = Room.all
  @rooms = @rooms.where(area: params[:area]) if params[:area].present?
  @rooms = @rooms.where("name like ?", "%#{params[:keyword]}%") if params[:keyword].present?
end

def new
  @room = Room.new
end

def create
  @room = Room.new(room_params)
  @room.user_id = current_user.id
  if @room.save
    redirect_to @room, notice: '宿泊施設を登録しました'
  else
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

def post
  @rooms = Room.all
  @q = Room.ransack(params[:q])
  @results = @q.result
  @number = @rooms.count
end

private
  def room_params
    params.require(:room).permit(:roomname, :description, :price, :address, :room_image, :user_id)
  end

end
      

