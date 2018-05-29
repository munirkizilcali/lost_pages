class CopiesController < ApplicationController

  before_action :user_check
  before_action :find_copy

	def index

	end

  def show

  end


  private

  def user_check
    redirect_to login_path unless current_user
  end

  def find_copy
    @copy = Copy.find_by(id: params[:id])
  end

end
