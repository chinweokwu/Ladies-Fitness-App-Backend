class Api::V1::WorkoutsController < ApiController
  def index
    workouts = Workout.all

    render json:WorkoutSerializer.new(workouts, options).serialized_json, status: :ok
  end

  def show
    workout = Workout.find(params[:id])

    render json: WorkoutSerializer.new(workout, options).serialized_json, status: :ok
  end

  def options
    @options ||= { include: %i[excerises]}
  end
end
