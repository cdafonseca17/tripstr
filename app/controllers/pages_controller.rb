class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @trips = Trip.all
  end

  def trip_days
    (@trip.end_date.to_date - @trip.start_date.to_date).to_i
  end

  def mytrips
    @trips = Trip.where(user: current_user)
  end
end
