class Api::V1::NotepadsController < ApiController
  before_action :set_notepad, only: %i[show update destroy]

  # GET /notepads
  def index
    @notepads = Notepad.all

    render json: @notepads
  end

  # GET /notepads/1
  def show
    render json: @notepad
  end

  # POST /notepads
  def create
    @notepad = Notepad.new(notepad_params)

    if @notepad.save
      render json: @notepad, status: :created, location: @notepad
    else
      render json: @notepad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notepads/1
  def update
    if @notepad.update(notepad_params)
      render json: @notepad
    else
      render json: @notepad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notepads/1
  def destroy
    @notepad.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notepad
    @notepad = Notepad.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def notepad_params
    params.require(:notepad).permit(:title, :body)
  end
end
