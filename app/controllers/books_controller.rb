class BooksController < ApplicationController

	def new
		if params[:search]
			@search_list = Book.search_google_books(params[:search])
		end
	end

	def create
		@book = Book.new(book_params)
		if @book.valid?
			@book.save
			@copy = Copy.create(book_id: @book.id, user_id:current_user.id)
			redirect_to copy_path(@copy)
		else
			render :new
		end
	end

	private

	def book_params
		params.require(:book).permit(:name, :isbn, :author, :short_description, :info_link, :cover_img)
	end
end
