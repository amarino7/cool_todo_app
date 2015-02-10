class SessionsController < ApplicationController
  def new
  	if current_user
  		redirect_to user_path(current_user.id)
  	end
  end

  def create
  	user_params = params .require(:user).permit(:email, :password)
  	user = User.confirm(user_params[:email], user_params[:password])
  	if user
  		login(user)
  		redirect_to user_path(user.id)
  	else
  		flash[:error] = "Failed to Authenticate. Please try again!!"
  		redirect_to "/login"
  	end
  end

  def destroy
  	logout
  	redirect_to "/login"
  end

end
