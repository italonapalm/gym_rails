class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token

  # Set Layout
  layout :layout_by_resource

  protected

    # Layout per resource_name
    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "backoffice_devise"
      else
        "application"
      end
    end

    def json_request?
      request.format.json?
    end

end
