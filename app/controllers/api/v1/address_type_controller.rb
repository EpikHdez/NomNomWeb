module Api
  module V1
    class AddressTypeController < ApplicationController
      before_action :set_address_type, only: [:show, :update, :destroy]

      def index
        @address_types = AddressType.all
      end

      def show
      end

      def create
        @address_type = AddressType.create(address_type_params)

        if @address_type.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @address_type.errors
          response.status = :bad_request
        end
      end

      def update
        @address_type.update(address_type_params)
        @success = true

        if !@address_type.save
          @success = false
          @errors = @address_type.errors
        end
      end

      def destroy
        @address_type.destroy
        response.status = :no_content
      end

      private

      def address_type_params
        params.require(:address_type).permit(:name)
      end

      def set_address_type
        @address_type = AddressType.find(params[:id])
      end
    end
  end
end
