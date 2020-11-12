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

product = Product.create(name: 'Canon EOS R', address: 'Chicago, IL', description: 'In good condition', start_time: "12/20/2020", end_time: '12/30/2020', image_url: 'http://4.bp.blogspot.com/_50rv3AgzGA8/RvS8N2TuSFI/AAAAAAAAA0k/C39Mo9ByghY/s1600/Canon_EOS_40D_Digital_SLR_Camera_with_Flash_Light_Review.jpg', comment: 'Pick up at my place', user_id: User.ids.sample)

product1 = Product.create(name: 'Canon EOS M100', address: 'Seattle, WA', description: 'Almost new', start_time: "11/22/2020", end_time: '12/30/2020', image_url: 'https://static.techspot.com/images2/news/bigimage/2017/08/2017-08-29-image-11.jpg', comment: 'Pick up at my place', user_id: User.ids.sample)

product2 = Product.create(name: 'Canon EOS R 24', address: 'Naperville, IL', description: 'In good condition', start_time: "11/01/2020", end_time: '12/30/2021', image_url: 'https://tse1.mm.bing.net/th?id=OIP.H1E-hggCeujO5tehx0kk6AHaHa&pid=Api&P=0&w=300&h=300', comment: 'Pick up at my place', user_id: User.ids.sample)

product3 = Product.create(name: 'Drone BLADE Chroma', address: 'Boston, MA', description: 'CG03-GB 4K Camera', start_time: "11/01/2020", end_time: '11/30/2020', image_url: 'https://www.bhphotovideo.com/images/images2000x2000/blade_blh8675_chroma_camera_drone_with_1165105.jpg', comment: 'Pick up at my place', user_id: User.ids.sample)

product4 = Product.create(name: 'Drone Yuneec Typhoon', address: 'Chicago, IL', description: 'In good condition, Q500 4K Camera', start_time: "12/20/2020", end_time: '12/30/2020', image_url: 'http://gadgetfive.co.uk/wp-content/uploads/2015/11/yuneec-q500-4K-03.jpg', comment: 'Pick up at my place', user_id: User.ids.sample)



listing = Listing.create(title: 'Camera', rating: 5, description: 'Good', price: 10, image_url: 'https://tse1.mm.bing.net/th?id=OIP.6nCVjA0S936UiBlDUsov4QHaE9&pid=Api&P=0&w=259&h=174', user_id: User.ids.sample, product_id: Product.ids.sample)