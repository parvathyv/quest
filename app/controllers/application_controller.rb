class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?

   helpers do
    def current_user
      user_id = session[:user_id]
      @current_user ||= User.find(user_id) if user_id.present?
          
    end

    def signed_in?
      current_user.present?
    end
   
    def set_current_user(user)
      session[:user_id] = user.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email]
  end

  protect_from_forgery with: :exception
end
