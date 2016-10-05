class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    authorize @profiles
    #authorize Profile # está correto, mas pode usar (authorize :profile) também
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    authorize @profile
  end

  def say_hello
    @profile = Profile.find(params[:profile_id])
    authorize @profile
    flash[:notice] = "Nada de mais aqui!"
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    build_roles_in @profile
    authorize @profile
  end

  # GET /profiles/1/edit
  def edit
    build_roles_in @profile
    authorize @profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        build_roles_in @profile

        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        build_roles_in @profile

        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

  def build_roles_in(profile)
    roles = Role.roles.map do |_, role|
      role[:actions].map {|action| "#{role[:role]}|-|#{action}" }
    end.flatten

    used_roles = []

    profile.permissions.each do |permission|
      role = "#{permission.role}|-|#{permission.action}"

      used_roles << role

      permission.destroy unless roles.include?(role)
    end

    roles.each do |role|
      next if role.in?(used_roles)

      role_name, action = role.split("|-|")

      profile.permissions.build(role: role_name, action: action)
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(
        :description, :manager_id, :editor_id, :active,
        permissions_attributes: [
          :id, :role, :action, :permit, :_destroy
        ]
      )
    end
end
