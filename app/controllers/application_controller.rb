class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    # look up the user, if they're logged in,
    # and save their user object to a variable called @current_user.
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
   # The helper_method line below allows us to use @current_user in our view files.
   helper_method :current_user

   # for sending someone to the login page if they aren't logged in
   # - this is how we keep certain pages our site secure
   def authorize
     redirect_to '/login' unless current_user
   end

    # private
    #
    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

end


# ADD before_filter :authorize TO DOC CONTROLLER SO
# USERS NOT SIGNED IN CAN'T DOC EVENTS/ACCESS DOC 
