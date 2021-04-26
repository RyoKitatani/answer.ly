class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    current_member.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:id])
    redirect_to request.referer
  end
end
