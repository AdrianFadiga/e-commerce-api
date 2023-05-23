require 'faker'

5.times do
  Category.create(name: Faker::Commerce.department(max: 1))
end

# Seed para produtos
20.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..100.0),
    description: Faker::Lorem.sentence(word_count: 10),
    category: Category.all.sample,
    quantity: rand(1..10)
  )
end

# Seed para users
User.create(
  provider: 'email',
  uid: 'admin@teste.com',
  encrypted_password: '$2a$12$UU.NCORSBiRaHTGTsTWzhuYgC0wYBox0cRN/HPvsLHmHL0VR/DPfq',
  allow_password_change: false,
  email: 'admin@teste.com',
  role: 'customer',
  tokens: { "3XphrbB3sysMcEwUSJytCA": { "token": '$2a$10$QSuFrn5lIpnl5OiZ6T2dL.CdnuJf7WsWyLTT4ljQGZ38NHra.uuLu',
                                        "expiry": 1_685_066_285 } },
  created_at: Time.now,
  updated_at: Time.now
)
