class Product < ActiveRecord::Base

  before_destroy :not_referenced_by_any_cart_item
  after_create :add_serial_number

  belongs_to :category, polymorphic: true, dependent: :destroy
  has_many :cart_items


  def add_serial_number
    self.update_column(:serial_number, generate_serial_number)
  end

  def generate_serial_number
    "GUI-" + SecureRandom.hex(2)
  end

  def price
    category.price
  end
  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, 'cart items present')
      throw :abort
    end
  end
end
