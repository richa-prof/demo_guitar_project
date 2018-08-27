class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    persisted? ? (product.price.to_i * quantity.to_i) : 0 rescue 0
  end
end
