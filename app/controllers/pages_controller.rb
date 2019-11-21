class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @trips = Trip.all
  end
  def trip_days
      (@trip.end_date - @trip.start_date).to_i
  end
end
