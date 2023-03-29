# db/seeds.rb
require 'faker'

# Create categories
categories = []
5.times do
  categories << Category.create(name: Faker::Book.genre)
end

# Create books
books = []
20.times do
  book = Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.decimal(l_digits: 2),
    categories: categories.sample(rand(1..3))
  )
  books << book
end

# Create users
users = []
5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  users << user
end

# Create orders
10.times do
  order = Order.create(
    user: users.sample,
    book: books.sample,
    quantity: rand(1..5)
  )
end