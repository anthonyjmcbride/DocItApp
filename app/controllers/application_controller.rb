class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

=======
  helper_method :current_user

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
>>>>>>> dfc2eac867d7be703f16c18d955701245c404f6c
end
