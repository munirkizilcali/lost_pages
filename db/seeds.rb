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
  {name:"munir", email: "munir@munir.com", password: "munir", password_confirmation: "munir"},
  {name:"adam", email: "adam@adam.com", password: "munir", password_confirmation: "munir"},
  {name:"lucas", email: "lucas@lucas.com", password: "munir", password_confirmation: "munir"},
  {name:"brittany", email: "brittany@brittany.com", password: "munir", password_confirmation: "munir"},
  {name:"richard", email: "richard@richard.com", password: "munir", password_confirmation: "munir"}
])

copies = Copy.create([
  {book_id: 1, user_id: 1},
  {book_id: 1, user_id: 2},
  {book_id: 1, user_id: 3},
  {book_id: 1, user_id: 4},
  {book_id: 1, user_id: 5},
  {book_id: 2, user_id: 1},
  {book_id: 2, user_id: 2},
  {book_id: 3, user_id: 1},
  {book_id: 3, user_id: 2},
  {book_id: 3, user_id: 3}
])

lendings = Lending.create([
  {copy_id: 1, borrower_id: 2},
  {copy_id: 2, borrower_id: 3},
  {copy_id: 3, borrower_id: 4},
  {copy_id: 4, borrower_id: 5},
  {copy_id: 5, borrower_id: 1}
])

friends = Friendship.create([
  {user_id: 1, friend_id: 2}
])






