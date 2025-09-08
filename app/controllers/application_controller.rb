class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redirect after logout
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
