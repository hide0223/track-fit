# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
   admin.password = ENV['ADMIN_PASSWORD']
end

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

test = Customer.find_or_create_by!(email: "test@example.com") do |customer|
 customer.name = "テスト"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer5.jpg"), filename:"sample-customer5.jpg")
end

track = Customer.find_or_create_by!(email: "track@example.com") do |customer|
 customer.name = "トラック"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer6.jpg"), filename:"sample-customer6.jpg")
end

fit = Customer.find_or_create_by!(email: "fit@example.com") do |customer|
 customer.name = "フィット"
 customer.password = "password"
 customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer7.jpg"), filename:"sample-customer7.jpg")
end




meal = Meal.find_or_create_by!(customer_id: alice.id ,body: "朝は果物中心です！",body_weight: 48.0,category: "朝食") do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal1.jpg"), filename:"meal1.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "ヨーグルト",kcal: 68)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "フルーツ",kcal: 30)

meal = Meal.find_or_create_by!(customer_id: carol.id ,body: "朝はヨーグルト派です",body_weight: 50.0,category: "朝食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal2.jpg"), filename:"meal2.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "ヨーグルト",kcal: 98)


meal = Meal.find_or_create_by!(customer_id: bob.id , body: "お昼はたんぱく質を多めに！",body_weight:71.0,category: "昼食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal3.jpg"), filename:"meal3.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "白米",kcal: 468)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "サラダチキン",kcal: 300)


meal = Meal.find_or_create_by!(customer_id: dave.id ,body: "今日はチートデイ！",body_weight: 70.0,category: "昼食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal4.jpg"), filename:"meal4.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "白米",kcal: 468)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "ステーキ",kcal: 600)

meal = Meal.find_or_create_by!(customer_id: test.id ,body: "牛で筋肥大！！",body_weight: 65.0,category: "夕食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal5.jpg"), filename:"meal5.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "白米",kcal: 468)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "ローストビーフ",kcal: 140)

meal = Meal.find_or_create_by!(customer_id: track.id ,body: "朝はたくさん食べる派です！！！",body_weight: 45.0,category: "朝食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal6.jpg"), filename:"meal6.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "食パン",kcal: 149)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "スクランブルエッグ",kcal: 130)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "副菜",eat_meal: "ソーセージ",kcal: 150)

meal = Meal.find_or_create_by!(customer_id: fit.id ,body: "朝ごはんは卵焼きが好きです",body_weight: 68.0,category: "朝食",) do |meal|
  meal.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meal7.jpg"), filename:"meal7.jpg")
end
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主食",eat_meal: "おにぎり",kcal: 170)
MealContent.find_or_create_by!(meal_id: meal.id ,meal_summary: "主菜",eat_meal: "卵焼き",kcal: 283)




training = Training.find_or_create_by!(customer_id: alice.id ,body: "ランニングは気持ちがいいです！",body_weight: 48.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training1.jpg"), filename:"training1.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "足",exercise: "ランニング")

training = Training.find_or_create_by!(customer_id: carol.id ,body: "この種目は三頭筋を鍛えるのにおすすめです！",body_weight: 50.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training2.jpg"), filename:"training2.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "腕",exercise: "フレンチプレス",weight: "10",sets: "5",reps: "10")

training = Training.find_or_create_by!(customer_id: bob.id ,body: "トレーニング仲間とスクワット！",body_weight: 71.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training3.jpg"), filename:"training3.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "足",exercise: "スクワット",weight: "90",sets: "5",reps: "7")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "足",exercise: "ブルガリアンスクワット",weight: "60",sets: "3",reps: "10")

training = Training.find_or_create_by!(customer_id: dave.id,body: "背中は効いているのかわからない..",body_weight: 70.0,)
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "背中",exercise: "ローロー",weight: "60",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "背中",exercise: "ラットプルダウン",weight: "55",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "背中",exercise: "チンニング",weight: "70",sets: "3",reps: "10")

training = Training.find_or_create_by!(customer_id: test.id ,body: "胸トレが一番好きです！！",body_weight: 65.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training5.jpg"), filename:"training5.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "胸",exercise: "ベンチプレス",weight: "70",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "胸",exercise: "ダンベルフライ",weight: "20",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "胸",exercise: "ディップス",weight: "65",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "胸",exercise: "ペックフライ",weight: "44",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "胸",exercise: "腕立てふせ",weight: "18",sets: "3",reps: "10")

training = Training.find_or_create_by!(customer_id: track.id ,body: "ストレッチは長めに行なっています",body_weight: 45.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training6.jpg"), filename:"training6.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "肩",exercise: "ダンベルショルダープレス",weight: "6",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "肩",exercise: "リアレイズ",weight: "4",sets: "3",reps: "10")

training = Training.find_or_create_by!(customer_id: fit.id ,body: "肩はなかなか成果がでませんね...",body_weight:68.0,) do |training|
  training.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/training7.jpg"), filename:"training7.jpg")
end
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "肩",exercise: "ダンベルショルダープレス",weight: "20",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "肩",exercise: "ケーブルサイドレイズ",weight: "18",sets: "3",reps: "10")
TrainingContent.find_or_create_by!(training_id: training.id ,body_parts: "肩",exercise: "リアレイズ",weight: "30",sets: "3",reps: "10")