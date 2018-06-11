module Api
  module V1
    class UsersController < ApplicationController
      def show
        
      end

      def update
        new_info = user_params
        @current_user.update(new_info)
        @success = true

        if !@current_user.save
          @success = false
          @errors = @user.errors
        end
      end

      private

      def user_params
        puts params
        params.require(:user).permit(:name, :last_name, :picture, :password, :password_confirmation)
      end
    end
  end
end