class ProfileFunctionalitiesController < ApplicationController
  before_action :set_profile_functionality, only: [:show, :edit, :update, :destroy]

  # GET /profile_functionalities
  # GET /profile_functionalities.json
  def index
    @profile_functionalities = ProfileFunctionality.all
  end

  # GET /profile_functionalities/1
  # GET /profile_functionalities/1.json
  def show
  end

  # GET /profile_functionalities/new
  def new
    @profile_functionality = ProfileFunctionality.new
  end

  # GET /profile_functionalities/1/edit
  def edit
  end

  # POST /profile_functionalities
  # POST /profile_functionalities.json
  def create
    @profile_functionality = ProfileFunctionality.new(profile_functionality_params)

    respond_to do |format|
      if @profile_functionality.save
        format.html { redirect_to @profile_functionality, notice: 'Profile functionality was successfully created.' }
        format.json { render :show, status: :created, location: @profile_functionality }
      else
        format.html { render :new }
        format.json { render json: @profile_functionality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_functionalities/1
  # PATCH/PUT /profile_functionalities/1.json
  def update
    respond_to do |format|
      if @profile_functionality.update(profile_functionality_params)
        format.html { redirect_to @profile_functionality, notice: 'Profile functionality was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_functionality }
      else
        format.html { render :edit }
        format.json { render json: @profile_functionality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_functionalities/1
  # DELETE /profile_functionalities/1.json
  def destroy
    @profile_functionality.destroy
    respond_to do |format|
      format.html { redirect_to profile_functionalities_url, notice: 'Profile functionality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_functionality
      @profile_functionality = ProfileFunctionality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_functionality_params
      params.require(:profile_functionality).permit(:profile_id, :functionality_id)
    end
end
