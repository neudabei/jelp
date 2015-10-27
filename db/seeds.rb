# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fabricate(:user, email: "email1@domain.com")
Fabricate(:user, email: "email2@domain.com")
Fabricate(:user, email: "email3@domain.com")
Fabricate(:user, email: "email4@domain.com")
Fabricate(:user, email: "email5@domain.com")

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
