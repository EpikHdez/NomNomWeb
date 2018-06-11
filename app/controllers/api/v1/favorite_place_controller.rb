module Api
  module V1
    class FavoritePlaceController < ApplicationController
      before_action :set_favorite_place, only: [:show, :destroy]

      def index
        @favorite_places = @current_user.favorite_places
      end

      def show

      end

      def create
        @favorite_place = @current_user.favorite_places.create(favorite_place_params)

        if @favorite_place.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @favorite_place.errors
          response.status = :bad_request
        end
      end

      def destroy
        @favorite_place.destroy
        render json: {message: 'Deleted'}, status: :ok
      end

      private

      def favorite_place_params
        params.require(:favorite_place).permit(:place_id)
      end

      def set_favorite_place
        @favorite_place = @current_user.favorite_places.find_by(place_id: params[:id])
      end
    end
  end
end
