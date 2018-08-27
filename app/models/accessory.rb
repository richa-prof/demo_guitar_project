class Accessory < ApplicationRecord
  self.per_page = 9
  mount_uploader :image, ImageUploader
  after_create :create_product_entry

  has_one :product, as: :category, dependent: :destroy

  def image_file
    image_url.nil? ? "default.jpg" : image_url.to_s
  end

  def price_money
    unless price.nil?
      helper.number_to_currency(price, :precision => 0)
    else
      "N/A"
    end
  end

  def details
    description.truncate(100)
  end
  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def create_product_entry
    Product.create(category: self)
  end
end
