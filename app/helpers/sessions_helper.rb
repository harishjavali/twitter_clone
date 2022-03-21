module SessionsHelper
    #logs in given user
    def log_in(user)
        session[:user_id] = user.id
        # # Guard against session replay attacks.
        # # See https://bit.ly/33UvK0w for more.
        session[:session_token] = user.session_token
    end
    #Remember a user in a persistent session
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    end
    #to return current loggedin user if any
    def current_user
        if (user_id = session[:user_id])
            # @current_user ||= User.find_by(id: user_id)
            user = User.find_by(id: user_id)
            if user && session[:session_token] == user.session_token
                @current_user = user
            end
        elsif (user_id = cookies.encrypted[:user_id])
            # raise # The tests still pass, so this branch is currently untested.
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    #returns true if the user is logged in, fasle otherwise
    def logged_in?
        !current_user.nil?
    end

    #Forget a persistent session.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    #logs out current user
    def log_out
        forget(current_user)
        reset_session
        @current_user=nil
    end
end
