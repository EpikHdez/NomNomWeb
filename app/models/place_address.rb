class PlaceAddress < ApplicationRecord
  belongs_to :place
  belongs_to :address
end
