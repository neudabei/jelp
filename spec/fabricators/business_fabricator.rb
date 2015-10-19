Fabricator(:business) do
  name Faker::Company.name
  description Faker::Lorem.paragraph(2)
  website Faker::Internet.url('example.com')
end