module Api
  module V1
    class PlaceCategoryController < ApplicationController
      before_action :set_place_category, only: [:show, :update, :destroy]

      def index
        @place_categories = PlaceCategory.all
      end

      def show
      end

      def create
        @place_category = PlaceCategory.create(place_category_params)

        if @place_category.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @place_category.errors
          response.status = :bad_request
        end
      end

      def update
        @place_category.update(place_category_params)
        @success = true

        if !@place_category.save
          @success = false
          @errors = @place_category.errors
        end
      end

      def destroy
        @place_category.destroy
        response.status = :no_content
      end

      private

      def place_category_params
        params.require(:place_category).permit(:name)
      end

      def set_place_category
        @place_category = PlaceCategory.find(params[:id])
      end
    end
  end
end
