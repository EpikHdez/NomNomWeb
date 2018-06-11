module Api
  module V1
    class NewsController < ApplicationController
      before_action :admin?, only: [:create, :update, :destroy]
      before_action :set_news, only: [:show, :update, :destroy]

      def index
        @news = News.order('created_at DESC')
      end

      def show
      end

      def create
        @news = News.create(news_params)

        if @news.save
          @success = true
          response.status = :created
        else
          @success = false
          @errors = @news.errors
          response.status = :bad_request
        end
      end

      def update
        @news.update(news_params)

        if @news.save
          @success = true
          response.status = :ok
        else
          @success = false
          @errors = @news.errors
          response.status = :bad_request
        end
      end

      def destroy
        @news.destroy
        response.status = :no_content
      end

      private

      def set_news
        @news = News.find(params[:id])
      end

      def news_params
        params.require(:news).permit(:title, :body)
      end

      def admin?
        if @current_user.user_type.id != 1
          render json: { errors: ['Not Authorized'] }, status: :unauthorized
          return
        end
      end
    end
  end
end
