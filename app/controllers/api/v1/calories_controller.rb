class Api::V1::CaloriesController < ApiController
  before_action :set_calory, only: %i[destroy]

  def index
    @calories = Calory.all

    render json: @calories
  end

  def create
    @calory = Calory.new(calory_params)

    if @calory.save
      render json: @calory, status: :created, location: @calory
    else
      render json: @calory.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @calory.destroy
  end

  private

  def set_notepad
    @calory = Calory.find(params[:id])
  end

  def calory_params
    params.require(:calory).permit(:date, :calories_lost)
  end
end
