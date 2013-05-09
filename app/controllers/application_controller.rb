class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user?
  def after_sign_in_path_for(resource)
     sites_path
   end
   protected
   def authorize
     unless user?
      flash[:notice] = "unathorized access"
      p "unathorized"
      redirect_to new_user_session_path
      false
    end
  end

  def user?
    if user_signed_in?
      true
    else
      false
    end
  end
end
