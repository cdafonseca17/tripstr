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

    def create
      @step = Step.create(step_params)
      @step.trip_id = params["trip_id"].to_i
      @trip = Trip.find(@step.trip_id)
      @steps = @trip.steps
      @activity = Activity.new
      if @step.save
        redirect_to edit_trip_path(@trip)
      else
        render 'trips/edit'
      end
    end

    def edit
    end

    def save
    end

    def update
    end

    def destroy
    end

    private
    def step_params
      params["step"].permit(:location, :nights)
    end
  end
