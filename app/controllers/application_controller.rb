class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :user_check

  def current_user
    if @current_user
      @current_user
    else
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def user_check
    redirect_to login_path unless current_user
  end
end
