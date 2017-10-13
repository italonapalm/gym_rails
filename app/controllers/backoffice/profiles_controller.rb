class Backoffice::ProfilesController < BackofficeController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def index
    @profile = Profile.new
    #@profile.build_profile_roles
    @profiles = Profile.ascending_name_order(params[:page])

    if params[:query].present?
      @profiles = Profile.search(params[:query])

      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @profile = Profile.new
    #@profile.build_profile_roles
    respond_to do |format|
      format.js
    end
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        flash.now[:notice] = I18n.t('messages.created_with', item: @profile.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.created_errors_with', item: @profile.model_name.human)
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @profile.update_attributes(profile_params)
        flash.now[:notice] = I18n.t('messages.updated_with', item: @profile.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.updated_errors_with', item: @profile.name)
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @profile.deactivate
        flash.now[:notice] = I18n.t('messages.destroyed_with', item: @profile.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.destroyed_errors_with', item: @profile.name)
        format.js
      end
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:id, :name, role_ids: [], profile_roles_attributes: [:id, :name])
    end

end
