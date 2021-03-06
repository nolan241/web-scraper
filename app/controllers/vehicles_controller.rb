class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :scrape, only: [:new]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = current_user.vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    if @vehicle_data.failure == nil
      @vehicle = Vehicle.new(
	        title: @vehicle_data.title,
	        price: @vehicle_data.price,
	        image_url: @vehicle_data.image_url,
	        miles: @vehicle_data.miles,
	        overview: @vehicle_data.overview        
        )
    else
      @vehicle = Vehicle.new
      if params[:search]
        @failure = @vehicle_data.failure
      end
    end
	end    
    
  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = current_user.vehicles.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:title, :price, :image_url, :overview, :miles, :user_id)
    end
    
    def scrape
      s = Scrape.new
      s.scrape_new_vehicle(params[:search].to_s)
      @vehicle_data = s
    end    
end
