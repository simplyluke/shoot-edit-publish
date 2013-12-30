class PointsController < ApplicationController
  before_filter :authenticate_user!, only: :destroy
  before_action :correct_user,       only: :destroy

  def create
    @point = current_user.points.build(point_params)
    if @point.save
      flash[:success] = "Points awarded!"
      redirect_to user_path(current_user)
    else
      render root_path
    end
  end

  def destroy
    @point.destroy
    redirect_to user_path(current_user)
  end

  private
    def point_params
      params.require(:point).permit(:value, :activity)
    end

    def correct_user
      @point = current_user.points.find_by(id: params[:id])
      redirect_to root_url if @point.nil?
    end
end
