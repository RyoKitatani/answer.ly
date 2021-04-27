class Public::RoomsController < ApplicationController

  def create
    room = Room.create
    current_entry = Entry.create(member_id: current_member.id, room_id: room.id)
    another_entry = Entry.create(member_id: params[:entry][:member_id], room_id: room.id)
    redirect_to room_path(room)
  end

  def index
    # ログインユーザーが属しているルームのIDを全て抽出して配列化
    current_entries = current_member.entries
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    # さらにmember_idがログインユーザーでは無いレコードを抽出
    @another_entries = Entry.where(room_id: my_room_ids).where.not(member_id: current_member.id).order(updated_at: :desc)
  end


  def show
    @room = Room.find(params[:id])
    @message = Message.new
    # メッセージ相手を抽出
    @another_entry = @room.entries.find_by('member_id != ?', current_member.id)
  end

end
