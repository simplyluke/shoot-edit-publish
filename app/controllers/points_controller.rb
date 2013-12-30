class PointsController < ApplicationController
  before_filter :authenticate_user!, only: :destroy
  before_action :correct_user,       only: :destroy

  def destroy
    @point.destroy
    redirect_to user_path(current_user)
  end

  private

    def correct_user
      @point = current_user.points.find_by(id: params[:id])
      redirect_to root_url if @point.nil?
    end
end
