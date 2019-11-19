class StepsController < ApplicationController
  def index
    @geotrips = Trip.geocoded # returns activities with coordinates
       @markers = @geotrips.map do |trip|
        {
          lat: trip.latitude,
          lng: trip.longitude
        }
      end
    end

    def new
    end

    def create
    end

    def edit
    end

    def save
    end

    def update
    end

    def destroy
    end
  end
