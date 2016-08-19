class FunctionalitiesController < ApplicationController
  before_action :set_functionality, only: [:show, :edit, :update, :destroy]

  # GET /functionalities
  # GET /functionalities.json
  def index
    @functionalities = Functionality.all
  end

  # GET /functionalities/1
  # GET /functionalities/1.json
  def show
  end

  # GET /functionalities/new
  def new
    @functionality = Functionality.new
  end

  # GET /functionalities/1/edit
  def edit
  end

  # POST /functionalities
  # POST /functionalities.json
  def create
    @functionality = Functionality.new(functionality_params)

    respond_to do |format|
      if @functionality.save
        format.html { redirect_to @functionality, notice: 'Functionality was successfully created.' }
        format.json { render :show, status: :created, location: @functionality }
      else
        format.html { render :new }
        format.json { render json: @functionality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functionalities/1
  # PATCH/PUT /functionalities/1.json
  def update
    respond_to do |format|
      if @functionality.update(functionality_params)
        format.html { redirect_to @functionality, notice: 'Functionality was successfully updated.' }
        format.json { render :show, status: :ok, location: @functionality }
      else
        format.html { render :edit }
        format.json { render json: @functionality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functionalities/1
  # DELETE /functionalities/1.json
  def destroy
    @functionality.destroy
    respond_to do |format|
      format.html { redirect_to functionalities_url, notice: 'Functionality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_functionality
      @functionality = Functionality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def functionality_params
      params.require(:functionality).permit(:description)
    end
end
