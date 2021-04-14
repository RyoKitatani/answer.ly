class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
       ContactMailer.contact_mail(@contact).deliver
       flash[:success] = "お問い合わせが完了しました。"
       redirect_to request.referer
    else
      flash[:danger] = "お問い合わせが上手くできませんでした。もう一度お試しください。"
      render new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :message)

  end

end
