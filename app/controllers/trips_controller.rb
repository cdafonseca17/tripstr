class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    # @trips = Trip.geocoded # returns activities with coordinates
    # @markers = @trips.map do |testmap|
    #   {
    #     lat: testmap.latitude,
    #     lng: testmap.longitude
    #   }
    # end
    # returns activities with coordinates
 end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
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
  end

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
