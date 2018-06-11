module Api
  module V1
    class UserTypeController < ApplicationController
      before_action :set_user_type, only: [:show, :update, :destroy]

      def index
        @user_types = UserType.all
      end

      def show
      end

      def create
        @user_type = UserType.create(user_type_params)

        if @user_type.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @user_type.errors
          response.status = :bad_request
        end
      end

      def update
        @user_type.update(user_type_params)
        @success = true

        if !@user_type.save
          @success = false
          @errors = @user_type.errors
        end
      end

      def destroy
        @user_type.destroy
        response.status = :no_content
      end

      private

      def user_type_params
        params.require(:user_type).permit(:name)
      end

      def set_user_type
        @user_type = UserType.find(params[:id])
      end
    end
  end
end
