class Public::RelationshipsController < ApplicationController

  def create
    current_member.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:id])
    redirect_to request.referer
  end

end
