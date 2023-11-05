class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when User
      public_users_show_path
    when Admin
      admin_clothes_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :user
      new_user_session_path
    when :admin
      new_admin_session_path
    end
  end
  
end
