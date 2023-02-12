class HomeController < ApplicationController
  def index
    @rooms = Room.search(params[:search])
    @rooms = Room.where("address like ?", "%#{params[:keyword]}%")
  end
end
