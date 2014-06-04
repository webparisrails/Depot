class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new(params[:contact])
  end
end