class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    packing_lists_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit :name for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # Permit :name for account updates
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
