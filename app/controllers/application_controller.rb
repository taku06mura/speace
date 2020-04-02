class ApplicationController < ActionController::Base
  before_action :basic_auth

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'spc01' && password == 'sp1209'
    end
  end
end
