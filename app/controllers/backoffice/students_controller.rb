class Backoffice::StudentsController < BackofficeController
  before_action :set_student, only: [:edit, :update, :destroy]

  def index
    @student = Student.new
    @student.build_address
    @states = State.all
    @cities = []
    @gyms = Gym.all
    @students = Student.actives(params[:page])

    if params[:query].present?
      @students = Student.search(params[:query])

      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @student = Student.new
    @student.build_address
    @states = State.all
    @cities = []
    @gyms = Gym.all
    respond_to do |format|
      format.js
    end
  end

  def edit
    @states = State.all
    @cities = City.cities_of_state(@student.address.city.state)
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @student.update_attributes(student_params)
        flash.now[:notice] = I18n.t('messages.updated_with', item: @student.full_name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.updated_errors_with', item: @student.full_name)
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @student.deactivate
        flash.now[:notice] = I18n.t('messages.destroyed_with', item: @student.full_name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.destroyed_errors_with', item: @student.full_name)
        format.js
      end
    end
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        flash.now[:notice] = I18n.t('messages.created_with', item: @student.full_name)
        format.js
      else
        flash.now[:alert] = I18n.t('messages.created_errors_with', item: @student.full_name)
        format.js
      end
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:id, :first_name, :last_name, :full_name, :birthdate, :cpf,
        :rg, :active, :email, :sex, gym_ids: [], address_attributes: [:id, :cep, :neighborhood, :number, :complement, :address,
        :reference, :city_id, :street], gym_students_attributes: [:id, :gym_id, :student_id, :registration_date,
        :active, :_destroy, gym_attributes: [:id, :name]])
    end
end
