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

# books = Book.create([
#   {name: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", img_url: "http://books.google.com/books/content?id=Sm5AKLXKxHgC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"},
#   {name: "Harry Potter - A Journey Through A History of Magic", author: "British Library", img_url: "http://books.google.com/books/content?id=ilc0DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"},
#   {name: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", img_url: },
#   {name: "the girl Who Lived", author: "Christopher Greyson"},
#   {name: "Spilled Milk", author: "K.L. Randis"}
# ])

users = User.create([
  {name:"munir", email: "munir@munir.com", password: "password", password_confirmation: "password"},
  {name:"adam", email: "adam@adam.com", password: "password", password_confirmation: "password"},
  {name:"lucas", email: "lucas@lucas.com", password: "password", password_confirmation: "password"},
  {name:"brittany", email: "brittany@brittany.com", password: "password", password_confirmation: "password"},
  {name:"richard", email: "richard@richard.com", password: "password", password_confirmation: "password"}
])

copies = Copy.create([
  {book_id: 1, user_id: 1, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 2, user_id: 1, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 3, user_id: 2, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 4, user_id: 2, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 5, user_id: 3, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 6, user_id: 3, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 7, user_id: 4, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 8, user_id: 4, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 9, user_id: 5, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 10, user_id: 5, condition: 4, purchased_date: "2018-01-05", notes: "An okay book."},
])

lendings = Lending.create([
  {copy_id: 1, borrower_id: 2, status: "requested"},
  {copy_id: 2, borrower_id: 3, status: "active", due_date: "2018-07-07"},
  {copy_id: 3, borrower_id: 4, status: "requested"},
  {copy_id: 4, borrower_id: 5, status: "requested"},
  {copy_id: 5, borrower_id: 1, status: "requested"},
  {copy_id: 6, borrower_id: 2, status: "requested"},
  {copy_id: 7, borrower_id: 1, status: "active", due_date: "2018-07-07"},
  {copy_id: 8, borrower_id: 2, status: "requested"},
  {copy_id: 9, borrower_id: 3, status: "requested"},
  {copy_id: 10, borrower_id: 4, status: "requested"},
])

friends = Friendship.create([
  {user_id: 1, friend_id: 2},
  {user_id: 1, friend_id: 3},
  {user_id: 1, friend_id: 4},
  {user_id: 1, friend_id: 5},
  {user_id: 2, friend_id: 3},
  {user_id: 3, friend_id: 4},
  {user_id: 4, friend_id: 5}
])






