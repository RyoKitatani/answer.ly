class Public::MembersController < ApplicationController
   before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def connections
  end


end
