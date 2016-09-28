class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product saved successfully"
      redirect_to products_path
    else
      flash[:alert] = "Product failed to save"
      render :new
    end
  end

  def edit
    @cart = current_cart
    @product = Product.find(params[:id])
    @add_to_cart = params[:add_to_cart]
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product added to cart"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product not added to cart"
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.delete
      flash[:notice] = "Product deleted"
      redirect_to products_path
    else
      flash[:alert] = "Product failed to delete"
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :description, :cart_id)
  end

end
