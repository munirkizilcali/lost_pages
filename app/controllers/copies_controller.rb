class CopiesController < ApplicationController

  before_action :user_check

	def index

	end

  private

  def user_check
    redirect_to login_path unless current_user
  end

end
