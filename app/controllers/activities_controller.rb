class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new(activity_params)
    @trip = params["trip_id"].to_i
    @activity.step_id = params["step_id"].to_i
    @activity.category = "comment"
    @activity.comment = params["activity"]["comment"]
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

  private
    def activity_params
      params["activity"].permit(:comment)
    end

  end














#   def edit
#   end

#   def update
#   end

#   def save
#   end

#   def destroy
#   end
# end
