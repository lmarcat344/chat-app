require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
    @room = FactoryBot.build(:room)
    @room.save
    @user = FactoryBot.build(:user)
    @user.save
    @message_no_image = Message.new(id: '3', content: "aaaa", user_id: @user.id, room_id: @room.id)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        @message.valid?
        expect(@message).to be_valid
      end
      it 'contentが空でも保存できる' do
        @message.content = ''
        @message.valid?
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message_no_image.valid?
        expect(@message_no_image).to be_valid ## message.image.attached? -> falseだから画像紐づいてない
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @message_no_image.content = ''
        @message_no_image.valid?
        expect(@message_no_image.errors.full_messages).to include("Content can't be blank") 
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room_id = '0'
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @message.user_id = '0'
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
