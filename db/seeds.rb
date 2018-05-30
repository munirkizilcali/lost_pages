# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = Book.create([
  {name: "Fellowship of the Ring", author: "J.R.R. Tolkien"},
  {name: "Harry Potter", author: "J.K. Rowling"},
  {name: "Silent Wife", author: "Kerry Fisher"},
  {name: "the girl Who Lived", author: "Christopher Greyson"},
  {name: "Spilled Milk", author: "K.L. Randis"}
])

users = User.create([
  {name:"munir", email: "munir@munir.com", password: "password", password_confirmation: "password"},
  {name:"adam", email: "adam@adam.com", password: "password", password_confirmation: "password"},
  {name:"lucas", email: "lucas@lucas.com", password: "password", password_confirmation: "password"},
  {name:"brittany", email: "brittany@brittany.com", password: "password", password_confirmation: "password"},
  {name:"richard", email: "richard@richard.com", password: "password", password_confirmation: "password"}
])

copies = Copy.create([
  {book_id: 1, user_id: 1, condition: 5, purchased_date: "2018-05-05", notes: "The greatest book."},
  {book_id: 1, user_id: 2, condition: 3, purchased_date: "2018-01-05", notes: "An okay book."},
  {book_id: 1, user_id: 3, condition: 1, purchased_date: "2000-05-05", notes: "Falling apart."},
  {book_id: 1, user_id: 4},
  {book_id: 1, user_id: 5},
  {book_id: 2, user_id: 1},
  {book_id: 2, user_id: 2},
  {book_id: 3, user_id: 1},
  {book_id: 3, user_id: 2},
  {book_id: 3, user_id: 3}
])

lendings = Lending.create([
  {copy_id: 1, borrower_id: 2, status: "requested", due_date: "2018-07-07"},
  {copy_id: 2, borrower_id: 3, status: "requested", due_date: "2018-06-07"},
  {copy_id: 3, borrower_id: 4, status: "returned", due_date: "2018-10-07"},
  {copy_id: 4, borrower_id: 5, status: "active", due_date: "2018-11-07"},
  {copy_id: 5, borrower_id: 1, status: "requested", due_date: "2018-01-07"}
])

friends = Friendship.create([
  {user_id: 1, friend_id: 2}
])






