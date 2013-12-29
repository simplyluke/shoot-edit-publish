class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      registration_params = [:email, :username, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_paramater_sanatizer.for(:account_update) {
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end
end
