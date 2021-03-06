class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /trips
  # GET /trips.json

  def index
    trip_days_param = params[:trip_days].to_i
    # @trips = Trip.all
    @trips = policy_scope(Trip).order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
      trips.name ILIKE :query \
      OR trips.country ILIKE :query \
      OR steps.location ILIKE :query \
      "
      # @trip = Trip.where(sql_query, query: "%#{params[:query]}%")
      @trips = Trip.joins(:steps).where(sql_query, query: "%#{params[:query]}%").uniq
    else
      @trips = Trip.all
    end
    if params[:trip_days].present?
      @trips = @trips.select { |trip|
        ((trip_days_param - 3)..(trip_days_param + 3)).to_a.include?(trip.end_date.to_date - trip.start_date.to_date).to_i }
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    authorize @trip
    @activities = @trip.activities
    # @activitymarkers = @activities.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     color: 'black', # blue ass water
    #     infoWindow: render_to_string(partial: "activity_info", locals: { activity: activity })
    #     #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    #   }
    # end
    @steps = @trip.steps
    # @stepmarkers = @steps.map do |step|
    #   {
    #     lat: step.latitude,
    #     lng: step.longitude,
    #     color: '#FE5665', # green from our Figma UI
    #     infoWindow: render_to_string(partial: "step_info", locals: { step: step })
    #     #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    #   }
    # end

    # @markers = @activitymarkers + @stepmarkers
  end

  def new
    @trip = Trip.new
    authorize @trip

    # @country = @trip.country
    # @countrymarkers = [{
    #     lat: @trip.latitude,
    #     lng: @trip.longitude,
    #     color: 'black', # blue ass water
    #     # infoWindow: render_to_string(partial: "activity_info", locals: { activity: activity })
    #     #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    #   }]

    # @markers = @countrymarkers

  end

  def create
    @trip = Trip.new(trip_params)
    @trip.country = @trip.country_name
    @trip.dates = params["dates"]
    @trip.start_date = params["dates"].split(" - ")[0]
    @trip.end_date = params["dates"].split(" - ")[1]
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to edit_trip_path(@trip)
    else
      render 'new'
    end
  end

  def edit
    # @steps1 = @trip.steps
      #.sort_by{|step| step.position}
      # @list.sort_by{|e| e[:time_ago]}
    @step = Step.new
    @activity = Activity.new
    authorize @trip
    @activities = @trip.activities
    # @activitymarkers = @activities.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     color: 'black', # blue ass water
    #     infoWindow: render_to_string(partial: "activity_info", locals: { activity: activity })
    #     #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    #   }
    # end
    @steps = @trip.steps
    # @steps = @trip.steps.geocoded # returns activities with coordinates
    # @stepmarkers = @steps.map do |step|
    #   {
    #     lat: step.latitude,
    #     lng: step.longitude,
    #     color: '#FE5665', # green from our Figma UI
    #     infoWindow: render_to_string(partial: "step_info", locals: { step: step })
    #     #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    #   }
    # end


    # @markers = @activitymarkers + @stepmarkers


        # infoWindow: render_to_string(partial: "country_info", locals: { country: country })

    # @markers = @activitymarkers + @stepmarkers
  end

  # POST /trips
  # POST /trips.json

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json

  def update
    params
    @step = Step.new
    @step.trip_id = @trip
    if params["dates"].present?
      @trip.dates = params["dates"]
      @trip.start_date = params["dates"].split(" - ")[0]
      @trip.end_date = params["dates"].split(" - ")[1]
    end
    @trip.country_code = params["trip"]["country_code"]
    @trip.country = @trip.country_name
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
      format.html { redirect_to mytrips_path, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params["trip"].permit(:name, :start_date, :end_date, :published, :country, :country_name, :country_code, :longitude, :latitude, :photo, :dates)

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

