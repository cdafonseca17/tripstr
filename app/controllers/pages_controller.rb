class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @trips = Trip.all
  end

  def mytrips
    @trips = Trip.where(user: current_user)
  end
end
