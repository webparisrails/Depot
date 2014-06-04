class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new(params[:contact])
    if @contact.save
      OrderNotifier.contact(@contact).deliver
    end
  end
end