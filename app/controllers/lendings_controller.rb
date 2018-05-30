class LendingsController < ApplicationController

  def new
    @lending = Lending.new
  end

  def create
    @lending = Lending.new(lending_params)
    @lending.save
    redirect_to user_path(current_user)
  end

  def update
    @lending = Lending.find_by(id: params[:id])
    @lending.lend_date = Time.now
    @lending.status = "active"
    # if @lending.valid?
    @lending.save
    redirect_to copies_path
    # end

  end

  private

  def lending_params
    params.require(:lending).permit(:copy_id, :borrower_id, :due_date, :lend_date, :status, :rating)
  end


end
