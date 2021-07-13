class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
        def configure_permitted_parameters
            # devise_parameter_sanitizer.for(:sign_up)  {|u| u.permit(:names, :email, :password, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :upload_diploma, :upload_cv, :availability_hour, :image, :phone) }
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :current_password.blank?])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password.blank?])
        end
end
