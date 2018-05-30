class BooksController < ApplicationController

	def new

		if params[:search]
			@search_list = Book.search_google_books(params[:search])
		end
	end
end
