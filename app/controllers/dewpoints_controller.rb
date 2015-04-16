class DewpointsController < ApplicationController
  before_action :set_dewpoint, only: [:show, :edit, :update, :destroy]

  # GET /dewpoints
  # GET /dewpoints.json
  def index
    @dewpoints = Dewpoint.all
  end

  # GET /dewpoints/1
  # GET /dewpoints/1.json
  def show
  end

  # GET /dewpoints/new
  def new
    @dewpoint = Dewpoint.new
  end

  # GET /dewpoints/1/edit
  def edit
  end

  # POST /dewpoints
  # POST /dewpoints.json
  def create
    @dewpoint = Dewpoint.new(dewpoint_params)

    respond_to do |format|
      if @dewpoint.save
        format.html { redirect_to @dewpoint, notice: 'Dewpoint was successfully created.' }
        format.json { render :show, status: :created, location: @dewpoint }
      else
        format.html { render :new }
        format.json { render json: @dewpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dewpoints/1
  # PATCH/PUT /dewpoints/1.json
  def update
    respond_to do |format|
      if @dewpoint.update(dewpoint_params)
        format.html { redirect_to @dewpoint, notice: 'Dewpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @dewpoint }
      else
        format.html { render :edit }
        format.json { render json: @dewpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dewpoints/1
  # DELETE /dewpoints/1.json
  def destroy
    @dewpoint.destroy
    respond_to do |format|
      format.html { redirect_to dewpoints_url, notice: 'Dewpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dewpoint
      @dewpoint = Dewpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dewpoint_params
      params.require(:dewpoint).permit(:current, :weather_id)
    end
end
