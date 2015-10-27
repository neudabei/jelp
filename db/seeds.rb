# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  Fabricate(:user, email: "email#{i+1}@domain.com")
end

Fabricate(:business, user_id: 1)
Fabricate(:business, user_id: 2)
Fabricate(:business, user_id: 3)
Fabricate(:business, user_id: 4)
Fabricate(:business, user_id: 4)
Fabricate(:business, user_id: 5)
Fabricate(:business, user_id: 5)

Fabricate(:review, business_id: 1, user_id: 1)
Fabricate(:review, business_id: 2, user_id: 2)
Fabricate(:review, business_id: 3, user_id: 3)
Fabricate(:review, business_id: 4, user_id: 1)
Fabricate(:review, business_id: 5, user_id: 2)
Fabricate(:review, business_id: 6, user_id: 3)
