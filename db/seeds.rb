# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all
Listing.destroy_all

user = User.create(first_name: 'Luke', last_name: 'k', age: 23, email:'fake@fake.com', phone_number: 123, password_digest: 1)

product = Product.create(name: 'Book', address: 'asdasd', description: 'asda', start_time: 20201025, end_time: 20201026, image_url: 'https://tse1.mm.bing.net/th?id=OIP.6nCVjA0S936UiBlDUsov4QHaE9&pid=Api&P=0&w=259&h=174', comment: 'sdad', user_id: User.ids.sample)

listing = Listing.create(title: 'Camera', rating: 5, description: 'Good', price: 10, image_url: 'https://tse1.mm.bing.net/th?id=OIP.6nCVjA0S936UiBlDUsov4QHaE9&pid=Api&P=0&w=259&h=174', user_id: User.ids.sample, product_id: Product.ids.sample)