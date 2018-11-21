class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # NEW
    devise_parameter_sanitizer.permit(:sign_up, keys: [:github_username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:github_username])

  end

  # Github Oauth method
  # def new_session_path(scope)
  #   new_user_session_path
  # end

end
