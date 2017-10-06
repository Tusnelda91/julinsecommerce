class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    
  @product = Product.find(params[:product_id])

  if user_signed_in?
      @user = current_user
  else
      redirect_to new_user_registration_path
  end

  token = params[:stripeToken]
  
  begin
    charge = Stripe::Charge.create(
      amount: (@product.price * 100).to_i, # amount in cents, again
      currency: "eur",
      source: token,
      description: params[:stripeEmail],
      #receipt_email: params[:stripeEmail]
    )

  if charge.paid
            Order.create(
              product_id: @product.id,
              user_id: @user.id,
              total: @product.price.to_i
            )
            flash[:notice] = "Thank you for purchasing #{@product.name}"
            #UserMailer.order_placed(@user, @product).deliver_now
        end

        rescue Stripe::CardError => e  # When the card has been declined
            body = e.json_body
            err = body[:error]
            flash[:alert] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end

    redirect_to product_path(@product)


  end
end
