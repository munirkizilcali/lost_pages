class Book < ApplicationRecord
	has_many :copies
	has_many :lendings, through: :copies
	has_many :users, through: :copies

	def self.search_google_books(string)
		html = open(URI.escape("https://www.googleapis.com/books/v1/volumes?q=#{string}")).read
		doc = JSON.parse(html)
		doc["items"]
	end

	def self.google_book_corrected(volume)
		corrected_book_info = {}
		if !volume['volumeInfo']['title'].nil? && volume['volumeInfo']['title'] != "" 
			corrected_book_info[:title] = volume['volumeInfo']['title']
		else
			corrected_book_info[:title] = "No book title"
		end

		if !volume['volumeInfo']['description'].nil? && volume['volumeInfo']['description'] != ""
			corrected_book_info[:short_description] = volume['volumeInfo']['description']
		else
			corrected_book_info[:short_description] = "No description"
		end

		if !volume['volumeInfo']['infoLink'].nil? && volume['volumeInfo']['infoLink'] != "" 
			corrected_book_info[:info_link] = volume['volumeInfo']['infoLink']
		else
			corrected_book_info[:info_link] = "No infoLink"
		end

		if !volume['volumeInfo']['imageLinks']['smallThumbnail'].nil? && volume['volumeInfo']['imageLinks']['smallThumbnail'] != ""
			corrected_book_info[:cover_img] = volume['volumeInfo']['imageLinks']['smallThumbnail']
		else
			corrected_book_info[:cover_img] = "http://via.placeholder.com/128x185"
		end

		if !volume['id'].nil? && volume['id'] != ""
			corrected_book_info[:isbn] = volume['id']
		else
			corrected_book_info[:isbn] = "NoISBN"
		end
		corrected_book_info
	end
end
