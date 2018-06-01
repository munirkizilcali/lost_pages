class CopiesController < ApplicationController

  before_action :user_check
  before_action :find_copy, only: [:show]

	def index

	end

  def show
    @lending = Lending.new
  end


  private

  def find_copy
    @copy = Copy.find_by(id: params[:id])
  end

end
