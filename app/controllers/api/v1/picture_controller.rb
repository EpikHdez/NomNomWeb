module Api
  module V1
    class PictureController < ApplicationController
      before_action :set_place
      before_action :set_picture, only: [:destroy]

      def create
        @picture = @place.pictures.create(picture_params)

        if @picture.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @picture.errors
          response.status = :bad_request
        end
      end

      def destroy
        @picture.destroy
        response.status = :no_content
      end

      private

      def set_place
        @place = Place.find(params[:place_id])
      end

      def set_picture
        @picture = @place.pictures.find(params[:id])
      end

      def picture_params
        params.require(:picture).permit(:url)
      end
    end
  end
end
