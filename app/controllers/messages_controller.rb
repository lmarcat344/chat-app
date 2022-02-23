class MessagesController < ApplicationController
  def index
    room_temp = RoomUser.where(user_id: current_user.id)
    @room = []
    room_temp.each do |room|
      @room << Room.find(room.room_id)
    end
  end
end
