class ApplicationController < ActionController::Base
    include UsersHelper

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    attributes = [:first_name, :last_name, :description]
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

end
