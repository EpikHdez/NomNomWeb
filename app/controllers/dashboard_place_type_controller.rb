class DashboardPlaceTypeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update, :destroy]

  def index
    @place_types = PlaceCategory.all
  end

  def create
    @place_type = PlaceCategory.create!(place_type_params)

    @place_types = PlaceCategory.all
    render :index
  end

  def update
    @place_type = PlaceCategory.find(params[:id])
    @place_type.update!(place_type_params)

    response.status = :no_content
  end

  def destroy
    @place_type = PlaceCategory.find(params[:id])
    @place_type.destroy

    response.status = :no_content
  end

  private

  def place_type_params
    if params[:place_type]
      params.require(:place_type).permit(:name)
    else
      params.permit(:name)
    end
  end
end
