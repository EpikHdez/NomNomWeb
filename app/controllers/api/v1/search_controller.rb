module Api
  module V1
    class SearchController < ApplicationController
      def search
        @places = Place.where("name LIKE ?", "%#{search_params}%")
      end

      private
      
      def search_params
        params.require(:name)
      end
    end
  end
end
