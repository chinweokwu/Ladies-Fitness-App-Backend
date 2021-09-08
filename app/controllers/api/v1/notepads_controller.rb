class Api::V1::NotepadsController < ApiController
  before_action :set_notepad, only: %i[destroy]

  def index
    @notepads = current_user.notepads.order(created_at: :desc)

    render json: @notepads
  end

  def create
    @notepad = current_user.notepads.build(notepad_params)

    if @notepad.save
      render json: @notepad, status: :created
    else
      render json: @notepad.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @notepad.destroy
  end

  private

  def set_notepad
    @notepad = Notepad.find(params[:id])
  end

  def notepad_params
    params.require(:notepad).permit(:title, :body, :user_id)
  end
end
