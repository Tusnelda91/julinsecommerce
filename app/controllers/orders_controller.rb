
class OrdersController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end
# GET /orders/new
  def new
    @order = Order.new
  end

 # GET /orders/1/edit
 # def edit
  #end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
       if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
   respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end 
  end  

   #def order_params
      #params.require(:order).permit(:name, :description, :image_url, :more_about, :price)
    #end
  

end
