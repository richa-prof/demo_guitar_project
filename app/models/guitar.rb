class Guitar < ApplicationRecord
  self.per_page = 9
  store_accessor :preferences
  mount_uploader :image, ImageUploader

  FILTERS = ["name", "brand", "model"]

  after_initialize :initialize_default_preferences_value
  after_create :create_product_entry

  scope :search_by_scope, -> (scope, term) { where("#{scope} ILIKE ?", "#{term}%")}

  validates :name, :guitar_type, :strings, :brand, :description, :price, presence: true

  has_one :product, as: :category, dependent: :destroy
  belongs_to :user, optional: true

  def check_value_exist(hash_key)
    self.preferences.nil? ? "" : self.preferences[hash_key]
  end

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

  def initialize_default_preferences_value
    preferences = {}
    preferences['series'] ||= ''
    preferences['shape'] ||= ''
    preferences['tuner'] ||= ''
    preferences['binding'] ||= ''
    preferences['neck'] ||= ''
  end

  def create_product_entry
    Product.create(category: self)
  end
end
