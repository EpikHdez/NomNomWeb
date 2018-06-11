module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request!

      def signin
        user = User.find_for_database_authentication(email: params[:email])

        if user and user.valid_password?(params[:password])
          render json: payload(user)
        else
          render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
        end
      end

      def signup
        info = info_params
        user = User.create(info)

        if user.save
          render json: payload(user), status: :created
        else
          render json: {errors: user.errors}, status: :bad_request
        end
      end

      private

      def payload(user)
        return nil unless user and user.id
        
        {
          jwt: JsonWebToken.encode({user_id: user.id}),
          user: user.attributes.slice('id', 'name', 'last_name', 'email', 'picture', 'user_type')
        }
      end

      def info_params
        params.require(:auth).permit(:name, :last_name, :email, :picture, :password, :password_confirmation)
      end
    end
  end
end
