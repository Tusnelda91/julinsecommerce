class StaticPagesController < ApplicationController
 
  def index
  end


  #def landing_page
  #	@featured_product = Product.first
  #end  

  def landing_page
  @products = Product.limit(7)
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
    #ActionMailer::Base.mail(from: @email,
      # to: 'julin@gmx.net',
      #subject: "A new contact form message from #{@name}",
      # body: @message).deliver_now
  UserMailer.contact_form(@email, @name, @message).deliver_now
  end
  
end
