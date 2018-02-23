class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.role == "admin"
      users_path
    else
      dashboard_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  private
  def layout_by_resource
    if devise_controller?
      "user"
    else
      "application"
    end
  end
end
