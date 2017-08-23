require 'random_data'
1.times do
  User.create!(
  first_name:  "admin",
  last_name:   "user",
  email:    "admin@user.com",
  password: "password123",
  manager: true
  )
end

1.times do
  User.create!(
  first_name:  "employee",
  last_name:   "user",
  email:    "employee@user.com",
  password: "passwordABC",
  manager: false
  )
end
5.times do
  User.create!(
    first_name:  RandomData.random_name,
    last_name:   RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

20.times do
   WashRecord.create!(
     user:   users.sample,
     vehicle_type:  "Car",
     amount_charged: 5,
     license_plate: RandomData.random_word
   )
 end

 20.times do
    WashRecord.create!(
      user:   users.sample,
      bed_down: false,
      vehicle_type:  "Truck",
      amount_charged: [10,12,5].sample,
      muddy_bed: [true,false].sample,
      license_plate: RandomData.random_word
    )
  end
 wash_records = WashRecord.all
