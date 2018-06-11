class AddressTypeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update, :destroy]

  def index
    @address_types = AddressType.all
  end

  def create
    @address_type = AddressType.create!(address_type_params)

    @address_types = AddressType.all
    render :index
  end

  def update
    @address_type = AddressType.find(params[:id])
    @address_type.update!(address_type_params)

    response.status = :no_content
  end

  def destroy
    @address_type = AddressType.find(params[:id])
    @address_type.destroy

    response.status = :no_content
  end

  private

  def address_type_params
    if params[:address_type]
      params.require(:address_type).permit(:name)
    else
      params.permit(:name)
    end
  end
end
