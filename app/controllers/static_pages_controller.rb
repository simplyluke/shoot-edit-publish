class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: :jesus

  def home
    @point = current_user.points.build if signed_in?
  end

  def help
  end

  def about
  end

  def jesus
  end
end
