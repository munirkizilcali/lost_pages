class Book < ApplicationRecord
	has_many :copies
	has_many :lendings, through: :copies
	has_many :users, through: :copies

	def self.search_google_books(string)
		html = open(URI.escape("https://www.googleapis.com/books/v1/volumes?q=#{string}")).read
		doc = JSON.parse(html)
		doc["items"]
	end
end
