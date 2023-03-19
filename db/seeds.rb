require 'faker'

5.times do
  Category.create(name: Faker::Commerce.department(max: 1))
end

# Seed para produtos
300.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..100.0),
    description: Faker::Lorem.sentence(word_count: 10),
    category: Category.all.sample
  )
end
