class Api::V1::CaloriesController < ApiController
  before_action :set_calory, only: %i[destroy]

  def index
    @calories = current_user.calories.order(created_at: :desc)

    render json: @calories
  end

  def create
    @calory = current_user.calories.build(calory_params)

    if @calory.save
      render json: @calory, status: :created
    else
      render json: @calory.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @calory.destroy
  end

  private

  def set_calory
    @calory = Calory.find(params[:id])
  end

  def calory_params
    params.require(:calory).permit(:date, :calories_lost, :user_id)
  end
end
