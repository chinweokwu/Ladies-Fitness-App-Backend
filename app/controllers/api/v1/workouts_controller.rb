class Api::V1::WorkoutsController < ApiController
  def index
    @workouts = Workout.all

    render json: @workouts, status: :ok
  end
end
