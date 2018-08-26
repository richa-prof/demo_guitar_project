class Guitar < ApplicationRecord
  self.per_page = 9
  store_accessor :preferences
  mount_uploader :image, ImageUploader

  FILTERS = ["name", "brand", "model"]

  before_destroy :not_referenced_by_any_cart_item
  after_initialize :initialize_default_preferences_value
  after_create :add_serial_number

  scope :search_by_scope, -> (scope, term) { where("#{scope} ILIKE ?", "#{term}%")}

  validates :name, :type, :type, :strings, :brand, :description, :price, presence: true

  has_many :cart_items
  belongs_to :user, optional: true

  def add_serial_number
    self.update_column(:serial_number, generate_serial_number)
  end

  def generate_serial_number
    "GUI-" + SecureRandom.hex(2)
  end

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

  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, 'cart items present')
      throw :abort
    end
  end

end
