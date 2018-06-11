module Api
  module V1
    class UserAddressController < ApplicationController
      before_action :set_address, only: [:show, :update, :destroy]

      def index
      end

      def show
      end

      def create
        @address = @current_user.addresses.create(address_params)

        if @address.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @address.errors
          response.status = :bad_request
        end
      end

      def update
        @address.update(address_params)

        if @address.save
          @success = true
        else
          @success = false
          @errors = @address.errors
          response.status = :bad_request
        end
      end

      def destroy
        user_adddress = UserAddress.find_by(address_id: @address.id)
        user_adddress.destroy

        @address.destroy
        response.status = :no_content
      end

      private

      def set_address
        @address = @current_user.addresses.find(params[:id])
      end

      def address_params
        preview = params.permit(:address, :longitude, :latitude, :address_type)
        preview[:address_type] = AddressType.find(preview[:address_type])
        preview
      end
    end
  end
end
