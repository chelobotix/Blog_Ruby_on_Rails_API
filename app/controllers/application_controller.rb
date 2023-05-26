class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def current_user
    User.first
  end
end
