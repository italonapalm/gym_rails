class Backoffice::GymsController < BackofficeController
  before_action :set_gym, only: [:edit, :update, :destroy]

  def index
    @gym = Gym.new
    @gyms = Gym.descending_order(params[:page])

    if params[:query].present?
      @gyms = Gym.search(params[:query])

      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @gym = Gym.new
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @gym.update_attributes(gym_params)
        flash.now[:notice] = I18n.t('messages.updated_with', item: @gym.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.updated_errors_with', item: @gym.name)
        format.js
      end
    end
  end

  def create
    @gym = Gym.new(gym_params)

    respond_to do |format|
      if @gym.save
        flash.now[:notice] = I18n.t('messages.created_with', item: @gym.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.created_errors_with', item: @gym.model_name.human)
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @gym.deactivate
        flash.now[:notice] = I18n.t('messages.destroyed_with', item: @gym.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.destroyed_errors_with', item: @gym.name)
        format.js
      end
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
