class Api::V1::ExcerisesController < ApiController
  before_action :set_excerise, only: [:show]
  before_action :get_workout

  def index
    @excerises = @workout.excerises

    render json: @excerises
  end

  def show
    render json: @excerise
  end

  private
  def get_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_excerise
    @excerise = @workout.excerise.find(params[:id])
  end
end
