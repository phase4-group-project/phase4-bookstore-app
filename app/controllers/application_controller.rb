class ApplicationController < ActionController::API
    include ActionController::Cookies

    rescue_from StandardError, with: :standard_error

    def app_response(message: 'success', status: 200, data: nil)
        render json: {
            message: message,
            data: data
        }, status: status
    end

    # store user id in session
    def save_user(id)
        session[:uid] = id
        session[:expiry] = 6.hours.from_now
    end

    # delete user id in session
    def remove_user
        session.delete(:uid)
        session[:expiry] = Time.now
    end

    # check for session expiry
    def session_expired?
        session[:expiry] ||= Time.now
       
      end

    # get logged in user
    def user
        User.find(session[:uid].to_i) 
    end

    # rescue all common errors
    def standard_error(exception)
        app_response(message: 'failed', data: { info: exception.message }, status: :unprocessable_entity)
    end

end
