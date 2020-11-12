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

product = Product.create(name: 'Canon EOS R', address: 'Chicago, IL', description: 'In good condition', start_time: "12/20/1125", end_time: '2020-11-30', image_url: 'http://4.bp.blogspot.com/_50rv3AgzGA8/RvS8N2TuSFI/AAAAAAAAA0k/C39Mo9ByghY/s1600/Canon_EOS_40D_Digital_SLR_Camera_with_Flash_Light_Review.jpg', comment: 'Pick up at my place', user_id: User.ids.sample)



listing = Listing.create(title: 'Camera', rating: 5, description: 'Good', price: 10, image_url: 'https://tse1.mm.bing.net/th?id=OIP.6nCVjA0S936UiBlDUsov4QHaE9&pid=Api&P=0&w=259&h=174', user_id: User.ids.sample, product_id: Product.ids.sample)