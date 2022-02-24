class MessagesController < ApplicationController
  before_action :get_sidebar_name, only: [:index, :create]
  before_action :get_form_parameter, only: [:index, :create]

  def index

    @messages = @room.messages.includes(:user)
    # @messages = @room.messages   ## @room.messagesからuserが取れないのは
    # @messages.each do |message|   ## @roomにたくさんmessageがあり１つに絞れないため
    #   binding.pry
    # end
    
  end

  def create
    @create_room = Room.find(params[:room_id])
    @create_message = @create_room.messages.new(config_params)
    before_mes_count = Message.count
   

    if  @create_message.save
      redirect_to action: :index
    else
      render action: :index
    end
  end



  private
  def config_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end

  def get_sidebar_name
     # サイドバーのルーム名表示のため 
   room_id_temp = RoomUser.where(user_id: current_user.id) 
   @room_id = [] 
   room_id_temp.each do |room| 
      @room_id << Room.find(room.room_id) 
   end 
  end

  def  get_form_parameter
    # メッセージフォーム用のデータを渡す
    @room = Room.find(params[:room_id])
    @message = Message.new()
  end
end
