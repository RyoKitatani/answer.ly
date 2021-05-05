class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    @member = Member.find(params[:relationship][:following_id])
    current_member.follow(params[:id])
    @member.create_notification_follow!(current_member)
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:id])
    redirect_to request.referer
  end
end
