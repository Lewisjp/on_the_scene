class GeolocationsController < ApplicationController
  before_action :set_geolocation, only: [:show, :edit, :update, :destroy]

  layout 'application'

  # GET /geolocations
  # GET /geolocations.json
  def index
    if params[:search].present?
      # When using Postgres along with the Geocoder gem, your queries cannot use symbolized keys, for example :distance
      @locations = Geolocation.near(params[:search], 0.50, :order => 'distance' )
    else
      @locations = Geolocation.limit(5)
    end

    # if the index returns false for search, it will display a random title
    @preview = Geolocation.find(rand(208))
    @movieAPIdata = Api.new(@preview.scenes.pluck(:title))

  end

  # GET /geolocations/1
  # GET /geolocations/1.json
  def show
    # Use pluck as a shortcut to select one or more attributes without loading a bunch of records just to grab the attributes you want.
    @movieAPIdata = Api.new(@location.scenes.pluck(:title))
  end

  # GET /geolocations/new
  def new
    @location = Geolocation.new
  end

  # GET /geolocations/1/edit
  def edit
  end

  # POST /geolocations
  # POST /geolocations.json
  def create
    @location = Geolocation.new(params[:geolocation])
    @scene = Scene.new(:title => params[:title])
    @location.scenes << @scene
    @location.save
    @scene.save

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully create.'}
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new"}
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geolocations/1
  # PATCH/PUT /geolocations/1.json
  def update

    respond_to do |format|
      if @location.update_attribute(params[:geolocation])
        format.html { redirect_to @location, notice: 'Location was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geolocations/1
  # DELETE /geolocations/1.json
  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to geolocation_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_geolocation
    @location = Geolocation.find(params[:id]) 
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def geolocation_params
    params.require(:geolocation).permit(:address, :latitude, :longitude, :borough, :neighborhood, :created_at, :updated_at)
  end
end