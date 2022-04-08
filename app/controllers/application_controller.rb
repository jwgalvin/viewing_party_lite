class ApplicationController < ActionController::Base
  # helper_method :current_user

  # def current_user 
  #   User.find(session[:user_id]) if session[:user_id]
  # end 
  
  # def require_user 
  #   if !current_user 
  #     flash[:alert] = 'you must be logged in'
  #     redirect_to root_path 
  #   end 
  # end 
  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
