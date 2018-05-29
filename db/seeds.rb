# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fellowship_of_the_ring = Book.create(name: "Fellowship of the Ring", author: "J.R.R. Tolkien")
harry_potter = Book.create(name: "Harry Potter", author: "J.K. Rowling")
silent_wife = Book.create(name: "Silent Wife", author: "Kerry Fisher")
the_girl_who_lived = Book.create(name: "the girl Who Lived", author: "Christopher Greyson")
spilled_milk = Book.create(name: "Spilled Milk", author: "K.L. Randis")

munir = User.create(name:"munir")
josh = User.create(name:"josh")
adam = User.create(name:"adam")
lucas = User.create(name:"lucas")
brittany = User.create(name:"brittany")
richard = User.create(name:"richard")


