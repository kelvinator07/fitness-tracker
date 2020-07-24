class ActivitiesController < ApplicationController
  # before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /activities
  # GET /activities.json
  def index
    # @user = User.find(current_user.id)
     @activities = current_user.activities
    # @activities = Activity.find_by(user_id: current_user.id)
    # @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @result_array = ["running Running", "dumbbell Weight", "walking Walking", "swimmer Swimming", "skiing-nordic Skiing", "hiking Hiking", "skating Skating", "biking Cycling", "snowboarding Snowing", "skiing-nordic Wheel-Chair"]
    @activity_array = [["Apple", "Apple"], ["Grape", "Grape"]]
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])

  end

  # POST /activities
  # POST /activities.json
  def create
    # @book = @author.books.create(published_at: Time.now)
    # @activity = @user.activities.new(activity_params)

    @activity = Activity.new(activity_params)
    @activity.user_id = current_user.id

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_url, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activities_url, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    # render plain: @activity.inspect
    @activity = Activity.find(params[:id])
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :date, :duration)
    end
end
