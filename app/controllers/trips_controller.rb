class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
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

  # GET /trips/1
  # GET /trips/1.json
  def show
    authorize @trip
    @activities = @trip.activities.geocoded
    @activitymarkers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        color: '#a7c9eb' # bluish water
      }
    end
    @steps = @trip.steps.geocoded # returns activities with coordinates
    @stepmarkers = @steps.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude,
        color: '#0bb97c' # green from our Figma UI
      }
    end

    @markers = @activitymarkers + @stepmarkers
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    authorize @trip
  end

  # GET /trips/1/edit
  def edit
    authorize @trip
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    #raise
    respond_to do |format|
      if @trip.update(trip_params)

      else

      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    authorize @trip
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.permit(:name, :start_date, :end_date)
    end
  end
