class Api::OrdersController < ApplicationController
  def index
    @orders = Order.all
    render 'index.json.jbuilder'
  end

  def create
    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.new(
                       user_id:  current_user.id,
                       product_id:  params[:product_id],
                       quantity:  params[:quantity],
                       subtotal: calculated_subtotal,
                       tax: calculated_tax,
                       total: calculated_total
                       )
    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end
end
