require 'json'

module Api
  module V1
    class PlaceController < ApplicationController
      before_action :set_place, only: [:show, :update, :destroy]

      def index
        @places = Place.all
      end

      def show
      end

      def create
        @place = Place.create(place_params)
        @address = Address.create(address_params)
        @place.address = @address

        pictures_params.each do |picture|
          @place.pictures.create(url: picture)
        end

        @place.place_types.create!(place_category_id: place_types_params)

        @success = true
        response.status = :created
      end

      def update
        @place.update(place_params)
        @success = true

        if !@place.save
          @success = false
          @errors = @place.errors
        end
      end

      def destroy
        @place.destroy
        response.status = :no_content
      end

      private

      def set_place
        @place = Place.find(params[:id])
      end

      def place_params
        preview = params.permit(:name)
        preview
      end

      def place_types_params
        params.require(:place_types)
      end

      def address_params
        preview = params.require(:address).permit(:address, :latitude, :longitude, :address_type)
        puts preview
        preview[:address_type] = AddressType.find(preview[:address_type])

        preview
      end

      def pictures_params
        params.require(:pictures)
      end
    end
  end
end
