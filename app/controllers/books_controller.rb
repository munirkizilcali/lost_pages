class BooksController < ApplicationController

	def new
		if params[:search]
			@search_list = Book.search_google_books(params[:search])
		end

	end

	def create

		@book = Book.find_or_create_by(isbn: book_params[:isbn]) do |b|
			b.attributes = book_params
		end
		@copy = Copy.new(book_id: @book.id, user_id:current_user.id)
		if @copy.valid?
			@copy.save
			redirect_to library_path
		else
			flash[:error] = @copy.errors.full_messages
			redirect_to new_book_path
		end
	end

	private

	def book_params
		params.require(:book).permit(:name, :isbn, :author, :short_description, :info_link, :cover_img)
	end
end
