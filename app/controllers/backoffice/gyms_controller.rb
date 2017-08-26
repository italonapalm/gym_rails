class Backoffice::GymsController < BackofficeController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    @gym = Gym.new
    @gyms = Gym.all

  end

  def show
  end

  def new
    @gym = Gym.new
    respond_to do |format|
      format.js { @gym }
    end

  end

  def edit
    respond_to do |format|
      format.js { @gym }
    end
  end

  def update

    if @gym.update_attributes(gym_params)
      respond_to do |format|
        format.js { @gym }
      end
    else
    end


  end

  def create
    @gym = Gym.new(gym_params)


    respond_to do |format|
      if @gym.save
        format.html { redirect_to backoffice_gyms_path, notice: "A academia #{@gym.name} foi salva com sucesso" }
        format.js { @gym }
      else
        format.html { render :new }
        format.js { render :show }
      end
    end


  end

  def destroy
    @gym.destroy

    unless @gym.errors.any?
      redirect_to backoffice_gyms_path, notice: "A academia #{@gym.name} foi deletada com sucesso"
    else
      render :index
    end

  end

  private
    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:id, :name)
    end
end
