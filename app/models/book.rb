class Book < ApplicationRecord
	has_many :copies
	has_many :lendings, through: :copies
	has_many :users, through: :copies

  def self.book_search(search)
    where("name LIKE ? OR author LIKE ? ", "%#{search}%", "%#{search}%")
  end

  def self.friend_book_search(search, current_user)
    book_search(search).joins(:copies).where(copies: {user_id: current_user.friend_ids})
  end

  def friend_copies(current_user)
    self.copies.where(user_id: current_user.friend_ids)
  end

	def self.search_google_books(string)
		if !string.empty?
			html = open(URI.escape("https://www.googleapis.com/books/v1/volumes?q=#{string}&maxResults=40")).read
			doc = JSON.parse(html)
			doc["items"]
		end
	end

	 def self.google_book_corrected(volume)

    default_book_info = {:name => "No book title", :short_description => "No description", :info_link => "No infoLink", :cover_img => "http://via.placeholder.com/128x185", :isbn => "NoISBN", :author => "No author info"}

    if volume['id'] && volume['id'] != ""
      default_book_info[:isbn] = volume['id']
    end

    if volume['volumeInfo']
      vol_info = volume['volumeInfo']

      if vol_info['title'] && vol_info['title'] != ""
        default_book_info[:name] = vol_info['title']
      end

      if vol_info['description'] && vol_info['description'] != ""
        default_book_info[:short_description] = vol_info['description']
      end

      if vol_info['infoLink'] && vol_info['infoLink'] != ""
        default_book_info[:info_link] = vol_info['infoLink']
      end

      if vol_info['authors'] && vol_info['authors'] != ""
        default_book_info[:author] = vol_info['authors'].join(', ')
      end

      if vol_info['imageLinks']
      	if vol_info['imageLinks']['smallThumbnail'] && vol_info['imageLinks']['smallThumbnail'] != ""
        	default_book_info[:cover_img] = vol_info['imageLinks']['smallThumbnail']
      	end
      end

    end

    default_book_info
  end

end
