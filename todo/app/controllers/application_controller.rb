class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

ENV['facebook_app_id']
  include SessionsHelper

  private
	  def authorized_user?
				user_id = (params[:id] || params[:user_id]).to_i
				if current_user.id != user_id
					redirect_to user_path(current_user)
				end
			end
end
