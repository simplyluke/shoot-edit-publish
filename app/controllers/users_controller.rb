class UsersController < ApplicationController
  before_filter :authenticate_user!, only: :index
 
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by_username(params[:id])
    @points = @user.points.paginate(page: params[:page], :per_page => 5)
  end
end
