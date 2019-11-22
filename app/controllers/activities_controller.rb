class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new(activity_params)
    @trip = params["trip_id"].to_i
    @activity.step_id = params["step_id"].to_i
    @activity.category = params["activity"]["category"]
    @activity.name = params["activity"]["name"]
    @activity.comment = params["activity"]["comment"]
    @step = Step.find(@activity.step_id)
    @activities = @step.activities
    # @activity.position = @activities.map {|activity| activity.position}.sort.last + 1
    # @step = Step.find(1)
    # @activity = Activity.new(activity_params)
    # @activity.step_id = @step
    # @trip = Trip.find(params["trip_id"])
    if @activity.save!
      redirect_to edit_trip_path(@trip)
    end
    # else
    #   render 'trips/edit'
    # end
  end

  def edit
    @trip = Trip.find(params["trip_id"])
    @step = Step.find(params["step_id"])
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @trip = Trip.find(params["trip_id"].to_i)
    @activity.update(activity_params)
    redirect_to edit_trip_path(@trip)
  end

  def destroy
    @step = Step.find(params["step_id"].to_i)
    @activity = Activity.find(params[:id])
    @trip = Trip.find(params["trip_id"].to_i)
    @activity.destroy
    redirect_to edit_trip_path(@trip)
  end

  private
    def activity_params
      params["activity"].permit(:comment, :name, :rating, :url, :icon, :types, :address, :latitude, :longitude, :photo)
    end
  end
