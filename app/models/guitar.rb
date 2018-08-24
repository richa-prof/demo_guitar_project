class Guitar < ApplicationRecord
  store_accessor :preferences
  mount_uploader :image, ImageUploader
  
  after_initialize :initialize_default_preferences_value
  after_create :add_serial_number
  #validates :name, :type, :type, :strings, :brand, :description, :price, presence: true

  def add_serial_number
    self.update_column(:serial_number, generate_serial_number)
  end

  def generate_serial_number
    "GUI-" + SecureRandom.hex(2)
  end

  def check_value_exist(hash_key)
    self.preferences.nil? ? "" : self.preferences[hash_key]
  end
  private

  def initialize_default_preferences_value
    preferences = {}
    preferences['series'] ||= ''
    preferences['shape'] ||= ''
    preferences['tuner'] ||= ''
    preferences['binding'] ||= ''
    preferences['neck'] ||= ''
  end
end
