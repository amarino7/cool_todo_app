class OmniauthController < ApplicationController
	def create
		# Signup if needed
		user = User.from_omniauth(env["omniauth.auth"])

		# Log in
    session[:user_id] = user.id

    # Redirect
    redirect_to root_url, notice: "You logged in!1"
	end
end
