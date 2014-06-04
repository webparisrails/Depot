class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new(params[:contact])
    OrderNotifier.contact(@contact).deliver
  end
end
