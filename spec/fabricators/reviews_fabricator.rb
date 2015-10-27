Fabricator(:review) do
  body {Faker::Lorem.paragraph(5)}
  stars {[1,2,3,4,5].sample}
end