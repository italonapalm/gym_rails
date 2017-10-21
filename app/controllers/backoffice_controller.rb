class BackofficeController < ApplicationController
  layout "backoffice"
  before_action :authenticate_admin!
  # alias_method :current_user, :current_admin

  # def current_ability
  #   @current_ability ||= Ability.new(current_admin)
  # end

  def current_ability
    current_admin.ability
  end

end
