module Api
  module V1
    class NearbyController < ApplicationController
      def index
        location = nearby_params

        @places = Place.joins(:place_address).joins(:address)
                        .where('abs(longitude - :lon) <= :r AND abs(latitude - :lat) <= :r',
                                {lon: location[:longitude], lat: location[:latitude],
                                r: location[:radius]})
      end

      private

      def nearby_params
        params.permit(:longitude, :latitude, :radius)
      end
    end
  end
end
