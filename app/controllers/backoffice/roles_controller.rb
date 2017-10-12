class Backoffice::RolesController < BackofficeController
  before_action :set_role, only: [:edit, :update, :destroy]

  def index
    @role = Role.new
    @roles = Role.ascending_name_order(params[:page])
    puts "111111"
    if params[:query].present?
      puts "param #{params[:query]}"
      @roles = Role.search(params[:query])
      puts "2"

      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @role = Role.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        flash.now[:notice] = I18n.t('messages.created_with', item: @role.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.created_errors_with', item: @role.model_name.human)
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
      if @role.update_attributes(role_params)
        flash.now[:notice] = I18n.t('messages.updated_with', item: @role.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.updated_errors_with', item: @role.name)
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @role.deactivate
        flash.now[:notice] = I18n.t('messages.destroyed_with', item: @role.name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.destroyed_errors_with', item: @role.name)
        format.js
      end
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:id, :name)
    end
end
