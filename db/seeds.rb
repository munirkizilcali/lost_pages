# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def search_google_books(string)
    html = open(URI.escape("https://www.googleapis.com/books/v1/volumes?q=#{string}&maxResults=10")).read
    doc = JSON.parse(html)
    doc["items"].each do |volume|
      book_hash = Book.google_book_corrected(volume)
      Book.create(book_hash)
    end
end

search_google_books("Harry Potter")
search_google_books("Ruby")

# books = Book.create([
#   {name: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", img_url: "http://books.google.com/books/content?id=Sm5AKLXKxHgC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"},
#   {name: "Harry Potter - A Journey Through A History of Magic", author: "British Library", img_url: "http://books.google.com/books/content?id=ilc0DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"},
#   {name: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", img_url: },
#   {name: "the girl Who Lived", author: "Christopher Greyson"},
#   {name: "Spilled Milk", author: "K.L. Randis"}
# ])

users = User.create([
  {name:"Fionna Apple", email: "fionna@fionna.com", password: "password", password_confirmation: "password"},
  {name:"Carson Wentz", email: "carson@carson.com", password: "password", password_confirmation: "password"},
  {name:"Bryce Harper", email: "bryce@bryce.com", password: "password", password_confirmation: "password"},
  {name:"Kelly Smith", email: "kelly@kelly.com", password: "password", password_confirmation: "password"},
  {name:"John Smith", email: "john@john.com", password: "password", password_confirmation: "password"}
])

copies = Copy.create([
  {book_id: 1, user_id: 1, condition: 5, purchased_date: "2018-07-07", notes: "The greatest book."},
  {book_id: 2, user_id: 1, condition: 4, purchased_date: "2018-01-07", notes: "An okay book."},
  {book_id: 3, user_id: 2, condition: 5, purchased_date: "2018-07-07", notes: "The greatest book."},
  {book_id: 4, user_id: 2, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 5, user_id: 3, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 6, user_id: 3, condition: 4, purchased_date: "2015-01-05", notes: "An okay book."},
  {book_id: 7, user_id: 4, condition: 5, purchased_date: "2015-05-05", notes: "The greatest book."},
  {book_id: 8, user_id: 4, condition: 4, purchased_date: "2015-01-05", notes: "An okay book."},
  {book_id: 9, user_id: 5, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 10, user_id: 5, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 11, user_id: 1, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 12, user_id: 1, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 13, user_id: 2, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 14, user_id: 2, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 15, user_id: 3, condition: 5, purchased_date: "2018-08-08", notes: "The greatest book."},
  {book_id: 16, user_id: 3, condition: 4, purchased_date: "2018-01-08", notes: "An okay book."},
  {book_id: 17, user_id: 4, condition: 5, purchased_date: "2018-08-05", notes: "The greatest book."},
  {book_id: 18, user_id: 4, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 19, user_id: 5, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 20, user_id: 5, condition: 4, purchased_date: "2014-01-05", notes: "An okay book."},
  {book_id: 10, user_id: 4, condition: 4, purchased_date: "2014-01-05", notes: "An okay book."},
  {book_id: 11, user_id: 2, condition: 5, purchased_date: "2014-05-05", notes: "The greatest book."},
  {book_id: 12, user_id: 2, condition: 4, purchased_date: "2014-01-05", notes: "An okay book."},
  {book_id: 13, user_id: 3, condition: 5, purchased_date: "2018-04-04", notes: "The greatest book."},
  {book_id: 14, user_id: 3, condition: 4, purchased_date: "2018-01-04", notes: "An okay book."},
  {book_id: 15, user_id: 4, condition: 5, purchased_date: "2018-04-04", notes: "The greatest book."},
  {book_id: 16, user_id: 4, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 17, user_id: 5, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 18, user_id: 5, condition: 4, purchased_date: "2013-01-05", notes: "An okay book."},
  {book_id: 19, user_id: 1, condition: 5, purchased_date: "2013-05-05", notes: "The greatest book."},
  {book_id: 20, user_id: 1, condition: 4, purchased_date: "2013-01-05", notes: "An okay book."}
])

lendings = Lending.create([
  {copy_id: 1, borrower_id: 2, status: "requested"},
  {copy_id: 2, borrower_id: 3, status: "active", lend_date: "2018-05-01"},
  {copy_id: 3, borrower_id: 4, status: "returned", rating: 5},
  {copy_id: 4, borrower_id: 5, status: "returned", rating: 4},
  {copy_id: 5, borrower_id: 1, status: "returned", rating: 3},
  {copy_id: 6, borrower_id: 1, status: "returned", rating: 1},
  {copy_id: 4, borrower_id: 1, status: "returned", rating: 4},
  {copy_id: 6, borrower_id: 1, status: "returned", rating: 1},
  {copy_id: 6, borrower_id: 2, status: "returned", rating: 2},
  {copy_id: 7, borrower_id: 1, status: "active", lend_date: "2018-05-01"},
  {copy_id: 8, borrower_id: 2, status: "requested"},
  {copy_id: 9, borrower_id: 3, status: "requested"},
  {copy_id: 10, borrower_id: 4, status: "requested"},
  {copy_id: 11, borrower_id: 2, status: "requested"},
  {copy_id: 12, borrower_id: 3, status: "active", lend_date: "2018-05-01"},
  {copy_id: 13, borrower_id: 4, status: "active"},
  {copy_id: 14, borrower_id: 5, status: "returned"},
  {copy_id: 15, borrower_id: 1, status: "requested"},
  {copy_id: 16, borrower_id: 1, status: "returned"},
  {copy_id: 14, borrower_id: 1, status: "returned"},
  {copy_id: 16, borrower_id: 1, status: "requested"},
  {copy_id: 16, borrower_id: 2, status: "returned"},
  {copy_id: 17, borrower_id: 1, status: "active", lend_date: "2018-05-01"},
  {copy_id: 18, borrower_id: 2, status: "requested"},
  {copy_id: 19, borrower_id: 3, status: "active"},
  {copy_id: 20, borrower_id: 4, status: "requested"}
])

friends = Friendship.create([
  {user_id: 1, friend_id: 2},
  {user_id: 1, friend_id: 3},
  {user_id: 1, friend_id: 4},
  {user_id: 1, friend_id: 5},
  {user_id: 2, friend_id: 3},
  {user_id: 2, friend_id: 4},
  {user_id: 2, friend_id: 5},
  {user_id: 3, friend_id: 4},
  {user_id: 3, friend_id: 5}
])






