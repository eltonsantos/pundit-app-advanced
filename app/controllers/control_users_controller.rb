class ControlUsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
  end

  def edit
    authorize @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to control_users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to control_users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to control_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :father_id, :manager_id, :editor_id, :profile_id, :password, :password_confirmation, :active)
    end

end
