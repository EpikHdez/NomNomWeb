class Place < ApplicationRecord
  has_many :pictures
  has_many :products

  has_many :place_types
  has_many :place_categories, through: :place_types

  has_one :place_address
  has_one :address, through: :place_address
end
