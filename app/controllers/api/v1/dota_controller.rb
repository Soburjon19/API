class Api::V1::DotaController < TokenController
  before_action :set_dotum, only: %i[ show update destroy ]
  before_action :auth, only: %i[ create update destroy ]
  # GET /dota
  def index
    @dota = Dotum.all

    render json: @dota
  end

  # GET /dota/1
  def show
    render json: @dotum
  end

  # POST /dota
  def create
    @dotum = Dotum.new(dotum_params)

    if @dotum.save
      render json: @dotum, status: :created
    else
      render json: @dotum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dota/1
  def update
    if @dotum.update(dotum_params)
      render json: @dotum
    else
      render json: @dotum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dota/1
  def destroy
    @dotum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dotum
      @dotum = Dotum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dotum_params
      params.require(:dotum).permit(:hero, :item, :team, :player)
    end
end
