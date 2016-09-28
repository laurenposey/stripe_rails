class CartsController < ApplicationController

  def show
    @cart = current_cart
  end

  # def new
  #   @cart = current_user.cart.new
  # end
  #
  # def create
  #   @cart = current_user.cart.new(cart_params)
  #   if @cart.save
  #     flash[:notice] = "Cart Created"
  #     redirect_to products_path
  #   else
  #     flash[:alert] = "Cart not created"
  #     render :new
  #   end
  # end

  def destroy
    @cart = current_user.cart.find(params[:id])
    if @cart.delete
      flash[:notice] = "Cart Deleted"
      redirect_to root_path
    else
      flash[:alert] = "Cart not deleted"
    end
  end

private
  def cart_params
    params.require(:cart).permit(:user_id)
  end

end
