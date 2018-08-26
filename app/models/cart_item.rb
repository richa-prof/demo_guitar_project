class CartItem < ApplicationRecord
  belongs_to :guitar
  belongs_to :cart

  def total_price
    persisted? ? (guitar.price.to_i * quantity.to_i) : 0
  end
end
