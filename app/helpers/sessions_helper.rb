module SessionsHelper
    #logs in given user
    def log_in(user)
        session[:user_id] = user.id
    end
    #to return current loggedin user if any
    def current_user
        if session[:user_id]
            @current_user ||=User.find_by(id: session[:user_id])
        end
    end
    #returns true if the user is logged in, fasle otherwise
    def logged_in?
        !current_user.nil?
    end

    #logs out current user
    def log_out
        reset_session
        @current_user=nil
    end
end
