class Admin::ContactsController < ApplicationController
  before_action :admin_header_actions

  def index
    @contacts = Contact.all
    @contacts_all = Contact.all.page(params[:page]).per(10)
  end
end
