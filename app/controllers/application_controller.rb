class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = %i[name job birthday family relation_type]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end

  def require_login
    return unless user_signed_in? && current_user.family.nil?
    if !request.path.eql?(new_family_path) && !request.path.eql?(families_path)
      flash[:error] = "Usuário não possui Familia"
      redirect_to new_family_path
    end
  end
end
