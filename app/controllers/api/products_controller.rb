class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'products.json.jbuilder'
  end


  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            image_url: params[:image_url]
                          )
  if @product.save
    render 'show.json.jbuilder'
  else
    render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
  end
end
  def show
    product_id = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])

    @rproduct.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @products.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Successfully removed recipe"}
  end
end
