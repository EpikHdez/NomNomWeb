module Api
  module V1
    class ProductController < ApplicationController
      before_action :set_place
      before_action :set_product, only: [:show, :update, :destroy]

      def index
        @products = @place.products
      end

      def show
      end

      def create
        @product = @place.products.create(product_params)
        
        if @product.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @product.errors
          response.status = :bad_request
        end
      end

      def update
        @product.update(product_params)
        
        if @product.save
          @success = true
        else
          @errors = @product.errors
          @success = false
          response.status = :bad_request
        end
      end

      def destroy
        @product.destroy
        response.status = :no_content
      end

      private

      def set_place
        @place = Place.find(params[:place_id])
      end

      def set_product
        @product = @place.products.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :picture)
      end
    end
  end
end
