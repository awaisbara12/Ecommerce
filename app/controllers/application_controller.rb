class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(users)
        if current_user.present? && current_user.admin?
            admin_admin_home_home_path
        else
          root_path
        end
      end

    protected
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :role,:password, :password_confirmation, :current_password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :role,:password, :password_confirmation, :current_password)}
    end
end
