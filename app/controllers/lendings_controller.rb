class LendingsController < ApplicationController

  helper_method :current_user
  helper_method :user_check

  def new
    if params[:search]
      @book_list = Copy.friend_copies_search(params[:search], current_user)
    end
  end

  def create
    @lending = Lending.new(lending_params)
    @lending.save
    redirect_to user_path(current_user)
  end

  def update
    @lending = Lending.find_by(id: params[:id])
    @lending.update(lending_params)
    # if @lending.valid?
    @lending.save
    redirect_to library_path
    # end
  end

  def borrowed_books

  end


  private

  def lending_params
    params.require(:lending).permit(:copy_id, :borrower_id, :due_date, :lend_date, :status, :rating)
  end


end
