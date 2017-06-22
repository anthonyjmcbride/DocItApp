class UsersController < ApplicationController

  # #Paperclip
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def new
    puts "********** test **********"
  end

  def index
    @users = Users.new
  end


  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode)
    end


end
