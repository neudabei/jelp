# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
john = User.create!(full_name: "John Doe", email: "john@example.com", password: "password123")
jane = User.create!(full_name: "Jane Doe", email: "jane@example.com", password: "password123")
erica = User.create!(full_name: "Erica Emmerich", email: "erica@domain.com", password: "password123")
mike = User.create!(full_name: "Mike Stone", email: "mike@domain.com", password: "password123")
tom = User.create!(full_name: "Tom Weatherfield", email: "tom@domain.com", password: "password123")
patricia = User.create!(full_name: "Patricia Johnson", email: "patricia@domain.com", password: "password123")

# Businesses
grocery = Business.create!(name: "Fruit Store", description: "Sell fruits and vegetables.", website: "http://www.grocery-store.com", user_id: 1)
coffee_shop1 = Business.create!(name: "Black Bean", description: "Freshly brewed coffee. Open 7 days a week.", website: "http://www.blackbean.com", user_id: 2)
coffee_shop2 = Business.create!(name: "Sunday coffee", description: "Organic coffee, ideal for long brunches on the weekend", website: "http://www.sunday-coffee.com", user_id: 3)
coffee_shop3 = Business.create!(name: "Dopio", description: "Espressos, single and double", website: "http://www.dopio.com", user_id: 1)
restaurant1 = Business.create!(name: "Mediterranean Olive", description: "The best of the mediterranean cuisine.", website: "http://www.mediterranean-olive.com", user_id: 2)
restaurant2 = Business.create!(name: "Pasta heaven", description: "Great pasta in all shapes and forms. We also have a cafe with Italian coffee.", website: "http://www.pasta-heaven.com", user_id: 2)
restaurant3 = Business.create!(name: "Greek corner", description: "Greek food", website: "http://www.greek-corner.com", user_id: 2)
butcher = Business.create!(name: "Butcher King", description: "The finest meats. Find everything you need.", website: "http://www.butcher-king.com", user_id: 3)
car_rental = Business.create!(name: "Rent a car", description: "Rent cars. From small to luxury models.", website: "http://www.rent-a-car.com", user_id: 4)

# Categories
restaurants = Category.create!(name: "Restaurants", description: "all the places you can eat")
cafes = Category.create!(name: "Cafes", description: "small, informal restaurants serving coffee and light refreshments")
super_markets = Category.create!(name: "Supermarkets", description: "buy groceries")

# Associate businesses with categories
grocery.categories << super_markets
coffee_shop1.categories << cafes
coffee_shop2.categories << cafes
coffee_shop3.categories << cafes
restaurant1.categories << restaurants
restaurant2.categories << restaurants
restaurant2.categories << cafes
restaurant3.categories << restaurants

# Reviews
Review.create!(body: "This is a great fruit store. They have everything you need and everything is fresh.", stars: 5, user_id: 1, business_id: 1, created_at: 3.days.ago)
Review.create!(body: "They are ok. Didn't find apples.", stars: 3, user_id: 2, business_id: 1, created_at: 1.day.ago)
Review.create!(body: "Good coffee. Also the chai tea is very good.", stars: 4, user_id: 2, business_id: 2, created_at: 7.days.ago)
Review.create!(body: "My coffee had way too much sugar in it.", stars: 0, user_id: 3, business_id: 2, created_at: 2.days.ago)
Review.create!(body: "Incredible food. Great service. Good value for money.", stars: 5, user_id: 4, business_id: 3, created_at: 3.days.ago)
Review.create!(body: "Very good food. It was great.", stars: 5, user_id: 1, business_id: 3, created_at: 4.days.ago)
Review.create!(body: "Good selection of meet. Bought here for our barbecue. The guests loved it.", stars: 5, user_id: 5, business_id: 4, created_at: 5.days.ago)
Review.create!(body: "Looked good, but I had to wait for hours in the queue.", stars: 2, user_id: 3, business_id: 4, created_at: 3.days.ago)
Review.create!(body: "Fast and easy to rent a car.", stars: 5, user_id: 5, business_id: 5)
Review.create!(body: "Ok, nothing to complain about.", stars: 4, user_id: 4, business_id: 5)
Review.create!(body: "Don't recommend this place. I had to pay a lot for extras.", stars: 0, user_id: 1, business_id: 5, created_at: 5.days.ago)