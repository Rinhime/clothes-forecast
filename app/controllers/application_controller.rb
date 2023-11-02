class ApplicationController < ActionController::Base
  
  def sign_in_path_for(resource)
    case resource
    when User
      public_user_path
    when Admin
      admin_root_path
    end
  end
  
  def sign_out_path_for(resource)
    case resource
    when User
      public_root_path
    when Admin
      admin_root_path
    end
  end
  
end
