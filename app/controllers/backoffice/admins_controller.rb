class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admin = Admin.new
    @admins = Admin.actives
    @profiles = Profile.actives
  end

  def new
    @admin = Admin.new
    @profiles = Profile.actives
    respond_to do |format|
      format.js
    end
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        flash.now[:notice] = I18n.t('messages.created_with', item: @admin.email)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.created_errors_with', item: @admin.model_name.human)
        format.js
      end
    end
  end

  def edit
    @profiles = Profile.actives
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @admin.update_attributes(admin_params)
        flash.now[:notice] = I18n.t('messages.updated_with', item: @admin.email)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.updated_errors_with', item: @admin.email)
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @admin.deactivate
        flash.now[:notice] = I18n.t('messages.destroyed_with', item: @admin.email)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.destroyed_errors_with', item: @admin.email)
        format.js
      end
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      if password_blank? && !create_action?
        params.require(:admin).permit(:id, :email, profile_ids: [])
      else
        params.require(:admin).permit(:id, :email, :password, :password_confirmation, profile_ids: [])
      end
    end

    def admin_update_params
      params.require(:admin).permit(:id, :email, profile_ids: [])
    end

    def password_blank?
      params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
    end

    def create_action?
      params[:action] == 'create'
    end
end
