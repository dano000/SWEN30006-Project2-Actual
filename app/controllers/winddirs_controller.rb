class WinddirsController < ApplicationController
  before_action :set_winddir, only: [:show, :edit, :update, :destroy]

  # GET /winddirs
  # GET /winddirs.json
  def index
    @winddirs = Winddir.all
  end

  # GET /winddirs/1
  # GET /winddirs/1.json
  def show
  end

  # GET /winddirs/new
  def new
    @winddir = Winddir.new
  end

  # GET /winddirs/1/edit
  def edit
  end

  # POST /winddirs
  # POST /winddirs.json
  def create
    @winddir = Winddir.new(winddir_params)

    respond_to do |format|
      if @winddir.save
        format.html { redirect_to @winddir, notice: 'Winddir was successfully created.' }
        format.json { render :show, status: :created, location: @winddir }
      else
        format.html { render :new }
        format.json { render json: @winddir.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winddirs/1
  # PATCH/PUT /winddirs/1.json
  def update
    respond_to do |format|
      if @winddir.update(winddir_params)
        format.html { redirect_to @winddir, notice: 'Winddir was successfully updated.' }
        format.json { render :show, status: :ok, location: @winddir }
      else
        format.html { render :edit }
        format.json { render json: @winddir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winddirs/1
  # DELETE /winddirs/1.json
  def destroy
    @winddir.destroy
    respond_to do |format|
      format.html { redirect_to winddirs_url, notice: 'Winddir was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winddir
      @winddir = Winddir.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def winddir_params
      params.require(:winddir).permit(:current, :weather_id)
    end
end
