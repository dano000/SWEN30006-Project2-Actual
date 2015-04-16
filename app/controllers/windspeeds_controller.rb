class WindspeedsController < ApplicationController
  before_action :set_windspeed, only: [:show, :edit, :update, :destroy]

  # GET /windspeeds
  # GET /windspeeds.json
  def index
    @windspeeds = Windspeed.all
  end

  # GET /windspeeds/1
  # GET /windspeeds/1.json
  def show
  end

  # GET /windspeeds/new
  def new
    @windspeed = Windspeed.new
  end

  # GET /windspeeds/1/edit
  def edit
  end

  # POST /windspeeds
  # POST /windspeeds.json
  def create
    @windspeed = Windspeed.new(windspeed_params)

    respond_to do |format|
      if @windspeed.save
        format.html { redirect_to @windspeed, notice: 'Windspeed was successfully created.' }
        format.json { render :show, status: :created, location: @windspeed }
      else
        format.html { render :new }
        format.json { render json: @windspeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /windspeeds/1
  # PATCH/PUT /windspeeds/1.json
  def update
    respond_to do |format|
      if @windspeed.update(windspeed_params)
        format.html { redirect_to @windspeed, notice: 'Windspeed was successfully updated.' }
        format.json { render :show, status: :ok, location: @windspeed }
      else
        format.html { render :edit }
        format.json { render json: @windspeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /windspeeds/1
  # DELETE /windspeeds/1.json
  def destroy
    @windspeed.destroy
    respond_to do |format|
      format.html { redirect_to windspeeds_url, notice: 'Windspeed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_windspeed
      @windspeed = Windspeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def windspeed_params
      params.require(:windspeed).permit(:current, :weather_id)
    end
end
