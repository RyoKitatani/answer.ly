class Admin::MembersController < ApplicationController
  before_action :admin_header_actions

  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def connection
  end

  private

end
