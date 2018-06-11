class PlaceType < ApplicationRecord
  belongs_to :place
  belongs_to :place_category
end
