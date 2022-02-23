class RoomsController < ApplicationController
  def index
    room_id_temp = RoomUser.where(user_id: current_user.id)
    @room_id = []
    room_id_temp.each do |room|
      @room_id << Room.find(room.room_id)
    end
  end
  def new
    @room = Room.new()
  end

  def create
    @room = Room.new(root_params)

    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def root_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
