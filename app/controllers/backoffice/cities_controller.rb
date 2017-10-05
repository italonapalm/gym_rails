class Backoffice::CitiesController < BackofficeController

  def index
    @cities = City.cities_of_state(params[:state_id])
    render json: @cities
  end

  def cities_of_state
    @cities = City.cities_of_state(params[:state_id])
    render json: @cities
  end

end
