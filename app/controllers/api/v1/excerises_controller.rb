class Api::V1::ExcerisesController < ApiController
  before_action :set_excerise, only: [:show]

  def index
    excerises = Excerise.all

    render json: ExceriseSerializer.new(excerises).serialized_json, status: :ok
  end

  def show
    render json: ExceriseSerializer.new(@excerise).serialized_json, status: :ok
  end

  private

  def set_excerise
    @excerise = Excerise.find(params[:id])
  end
end
