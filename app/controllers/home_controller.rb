class HomeController < ApplicationController
  def index
    @rooms = Room.search(params[:search])
    @rooms = Room.where("roomname like ?", "%#{params[:keyword]}%")
  end
end
