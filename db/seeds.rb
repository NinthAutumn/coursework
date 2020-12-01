# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
require 'faker'

# Park.delete_all
# User.delete_all


# User.create([
#   {username:"DefTech",email:'def.tech@gmail.com',password:BCrypt::Password.create("123456789")},
#   {username:"Ninth",email:'ninth@gmail.com',password:BCrypt::Password.create("123456789")},
#   {username:"User2",email:'User2@gmail.com',password:BCrypt::Password.create("123456789")},
#   {username:"User3",email:'User3@gmail.com',password:BCrypt::Password.create("123456789")}
# ])

users = []
for i in 0..20 do
 user = User.new({
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password:"123456789",
    password_confirmation:"123456789"
 })
 user.save
 for i in 0..5 do
  car = Car.create({
    user_id:user.id,
    name: Faker::Vehicle.make_and_model,
    number_plate:Faker::Vehicle.license_plate,
    brand:Faker::Vehicle.manufacture
  })
  
  park = Park.create({
    user_id:user.id,
    name:Faker::Address.street_name,
    address_line_1: Faker::Address.street_address,address_line_2: "",
    post_code:Faker::Address.postcode,
    cover: "https://picsum.photos/1500/500",
    avatar: "https://picsum.photos/100/100",
    images:"https://picsum.photos/500/300, https://picsum.photos/500/300, https://picsum.photos/500/300,https://picsum.photos/500/300",
    description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dictum nisi velit, at dapibus libero congue id. Cras libero est, auctor at nibh quis, finibus auctor quam. Sed sollicitudin tortor dui, at feugiat sem finibus porttitor. Ut elementum quis orci non molestie. Curabitur ut finibus libero, eget blandit arcu. Pellentesque in leo ac purus sagittis vestibulum. Fusce vel est eu metus consequat vehicula. Vivamus vel feugiat urna. Nam id turpis vel quam gravida vulputate at id velit. Integer dapibus dignissim odio, a dapibus mauris vulputate at. Nullam cursus suscipit volutpat. Proin ac justo laoreet, gravida sem sit amet, dignissim arcu. Nulla tincidunt eros urna, id pellentesque mauris vehicula non. Aenean vestibulum euismod neque sed rhoncus. Aliquam at leo velit. Phasellus sed dignissim sapien, vel tempus dolor." 
  })
  for i in 0..15 do 
    slot = ParkSlot.create({
      park_id: park.id,
      price: rand(1..100),
      width: rand(100..5000),
      height: rand(100..5000)
    })
    if i == 5 then
      CarParkSlot.create({
        park_slot_id: slot.id,
        car_id: car.id,
        from_date: Time.now,
        until_date: Time.now + 1.weeks
      })
    end 
  end
end
end


parks = []






