class DashboardUserTypeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update, :destroy]

  def index
    @user_types = UserType.all
  end

  def create
    @user_type = UserType.create!(user_type_params)

    @user_types = UserType.all
    render :index
  end

  def update
    @user_type = UserType.find(params[:id])
    @user_type.update!(user_type_params)

    response.status = :no_content
  end

  def destroy
    @user_type = UserType.find(params[:id])
    @user_type.destroy

    response.status = :no_content
  end

  private

  def user_type_params
    if params[:user_type]
      params.require(:user_type).permit(:name)
    else
      params.permit(:name)
    end
  end
end
