class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :email, :password, :post_counter, :photo, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name,
               :bio,
               :email,
               :password,
               :current_password,
               :photo,
               :role)
    end
  end
end