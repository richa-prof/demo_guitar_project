class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:remove_from_cart]

  def add_to_cart
    @product = Product.find(params[:product_id])
    @cart_item = @cart.add_items(@product)
    @cart.save
  end

  def update_quantity
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_column(:quantity, params[:quantity])
    @cart_items = @cart.cart_items
  end

  def remove_from_cart
    @cart_item.destroy if @cart.id == session[:cart_id]
    @cart_items = @cart.cart_items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = @cart.cart_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
    end
end
