class DashboardNewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update, :destroy]

  def index
    @news = News.all
  end

  def create
    @news = News.create!(news_params)

    @news = News.all
    render :index
  end

  def update
    @news = News.find(params[:id])
    @news.update!(news_params)

    response.status = :no_content
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    response.status = :no_content
  end

  private

  def news_params
    if params[:news]
      params.require(:news).permit(:title, :body)
    else
      params.permit(:title, :body)
    end
  end
end
