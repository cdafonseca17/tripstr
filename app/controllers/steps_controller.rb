class StepsController < ApplicationController
  def new
  end

    def create
      @step = Step.create(step_params)
      @step.trip_id = params["trip_id"].to_i
      @trip = Trip.find(@step.trip_id)
      @steps = @trip.steps
      # @step.position = @steps.map {|step| step.position}.sort.last + 1
      @activity = Activity.new
      if @step.save
        redirect_to edit_trip_path(@trip)
      else
        render 'trips/edit'
      end
    end

    def edit
      @trip = Trip.find(params["trip_id"])
      @step = Step.find(params[:id])
    end

    def update
      @step = Step.find(params[:id])
      @trip = Trip.find(params["trip_id"].to_i)
      @step.update(step_params)
      #@step = Step.new(step_params)
      redirect_to edit_trip_path(@trip)

    end

    def destroy
      @step = Step.find(params[:id])
      @trip = Trip.find(params["trip_id"].to_i)
      @step.destroy
      redirect_to edit_trip_path(@trip)
    end

    private
    def step_params
      params["step"].permit(:location, :nights)
    end
  end
