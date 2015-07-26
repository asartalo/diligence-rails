class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  # With +respond_to do |format|+, "406 Not Acceptable" is sent on invalid format.
  # With a regular render (implicit or explicit), this exception is raised instead.
  # Log it to Exception Logger, but show users a 404 page instead of error 500.
  rescue_from(ActionController::MissingTemplate) do |e|
    log_exception(e)
    request.format = :html
    render_404
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def user
    current_user
  end

  def text_plain
    { content_type: 'text/plain' }
  end

  def not_found
    head 404, text_plain
  end

  def bad_request
    head 400, text_plain
  end

  def no_content
    head 204, text_plain
  end
end
