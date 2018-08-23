class Guitar < ApplicationRecord
  store_accessor :preferences

  after_initialize :initialize_default_preferences_value
  #validates :name, :type, :type, :strings, :brand, :description, :price, presence: true

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
