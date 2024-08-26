# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin'
)

alice = Customer.find_or_create_by!(email: "alice@example.com") do |customer|
 customer.name = "Alice"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.jpg"), filename:"sample-customer1.jpg")
end

carol = Customer.find_or_create_by!(email: "carol@example.com") do |customer|
 customer.name = "Carol"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.jpg"), filename:"sample-customer2.jpg")
end

bob = Customer.find_or_create_by!(email: "bob@example.com") do |customer|
 customer.name = "Bob"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.jpg"), filename:"sample-customer3.jpg")
end

dave = Customer.find_or_create_by!(email: "dave@example.com") do |customer|
 customer.name = "Dave"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer4.jpg"), filename:"sample-customer4.jpg")
end

テスト = Customer.find_or_create_by!(email: "test@example.com") do |customer|
 customer.name = "テスト"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer5.jpg"), filename:"sample-customer5.jpg")
end

トラック = Customer.find_or_create_by!(email: "track@example.com") do |customer|
 customer.name = "トラック"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer6.jpg"), filename:"sample-customer6.jpg")
end

フィット = Customer.find_or_create_by!(email: "fit@example.com") do |customer|
 customer.name = "フィット"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer7.jpg"), filename:"sample-customer7.jpg")
end


Meal.find_or_create_by!(
  customer_id: 7,
  body: "朝ごはんは卵焼きが好きです",
  body_weight: 68.0,
  category: "朝食"
)

MealContent.find_or_create_by!(
  meal_id: 7,
  meal_summary: "主食",
  eat_meal: "おにぎり",
  kcal: 100
)

MealContent.find_or_create_by!(
  meal_id: 7,
  meal_summary: "主菜",
  eat_meal: "卵焼き",
  kcal: 100
)