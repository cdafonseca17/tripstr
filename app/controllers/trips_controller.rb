class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @trips = policy_scope(Trip).order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
        trips.name ILIKE :query \
        OR steps.location ILIKE :query \
      "
      @trips = Trip.joins(:steps).where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.all
    end
  end

  def show
    authorize @trip
    @activities = @trip.activities.geocoded
    @activitymarkers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        color: '#a7c9eb', # blue ass water
        infoWindow: render_to_string(partial: "activity_info", locals: { activity: activity })
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
    @steps = @trip.steps.geocoded # returns activities with coordinates
    @stepmarkers = @steps.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude,
        color: '#0bb97c', # green from our Figma UI
        infoWindow: render_to_string(partial: "step_info", locals: { step: step })
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end

    @markers = @activitymarkers + @stepmarkers
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to edit_trip_path(@trip)
    else
      render 'new'
    end
  end

  def edit
    @steps = @trip.steps
    @step = Step.new
    @activity = Activity.new
    authorize @trip
  end

  # POST /trips
  # POST /trips.json

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json

  def update
    @step = Step.new
    @step.trip_id = @trip
    if @trip.update(trip_params)
      redirect_to edit_trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    authorize @trip
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params["trip"].permit(:name, :start_date, :end_date)
    end
end

    # respond_to do |format|
    #   if @trip.save
    #     format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
    #     format.json { render :show, status: :created, location: @trip }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @trip.errors, status: :unprocessable_entity }
    #   end
    # end


  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json


  # DELETE /trips/1
  # DELETE /trips/1.json
