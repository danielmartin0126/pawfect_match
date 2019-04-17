class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user

    def m_f
        if :gender == true
            "Female"
        else
            "Male"
        end
    end

    def current_user
      User.find_by({id: session[:user_id]})
    end

    def logged_in?
      !!current_user
    end

    def authorized
      redirect_to login_path unless logged_in?
    end 

    def custom_auth_method
      flash[:notice] = "This account does not currently exist"
      redirect_to current_user
    end

end
