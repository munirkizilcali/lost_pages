class CopiesController < ApplicationController

  before_action :user_check
  before_action :find_copy, only: [:show, :destroy]

	def index

	end

  def show
    @lending = Lending.new
  end

  def destroy
    @copy.destroy
    flash[:message] = "Book deleted from library"
    redirect_to copies_path
  end


  private

  def find_copy
    @copy = Copy.find_by(id: params[:id])
  end

end
