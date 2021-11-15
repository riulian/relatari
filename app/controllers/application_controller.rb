class ApplicationController < ActionController::Base    
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    
    def authenticate_amin
      redirect_to root_url, alert: "Nu ai acces" unless 
          current_user && current_user.admin?
    end      
    
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :role_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :email, bank_attributes: [:bank_name, :bank_account]])
    end
  end