# require 'csv'

# # seed brands and models
# Auto.destroy_all
# puts 'Autos destroyed'
# Guincho.destroy_all
# puts 'Guinchos destroyed'
# Car.destroy_all
# puts 'Cars destroyed'
# Winch.destroy_all
# puts 'Winches destroyed'
# User.destroy_all
# puts 'Users destroyed'
# Photo.destroy_all
# puts 'Photos destroyed'
# Review.destroy_all
# puts 'Reviews destroyed'

# filepath = 'db/marcas.csv'
# marcas = {}
# CSV.foreach(filepath, headers:true) do |row|
#   marcas[row[1]] = row[2]
# end
# puts 'marcas'
# filepath2 = 'db/modelos.csv'
# CSV.foreach(filepath2, headers:true) do |row|
#   auto = Auto.new()
#   row = row.to_s.split(";")
#   auto.model = row[3].gsub('""', '')
#   auto.brand = marcas[row[1].gsub(/\W/,'')]
#   auto.save
#   puts "#{auto.model} saved on db"
# end
# filepath = 'db/guinchos.csv'
# marcas = {}
# CSV.foreach(filepath) do |row|
#   guincho = Guincho.new()
#   guincho.brand = row[0]
#   guincho.model = row[1]
#   guincho.save
#   puts "#{guincho.model} saved on DB"
# end

# seed users (first_name, last_name, email, password, winch, visible, photo)

users = [{
  first_name: 'Vinicius',
  last_name: 'Costa',
  email: 'vinicius@gmail.com',
  password: '123456',
  winch: true,
  visible: true
}, {
  first_name: 'Rhaniel',
  last_name: 'Valle',
  email: 'rhaniel@gmail.com',
  password: '123456',
  winch: false,
  visible: true
}, {
  first_name: 'Carlos',
  last_name: 'Silva',
  email: 'carlos@gmail.com',
  password: '123456',
  winch: true,
  visible: true
}, {
  first_name: 'João Vicente',
  last_name: 'Conte',
  email: 'joao@gmail.com',
  password: '123456',
  winch: false,
  visible: true
}]
u = ''
users.each do |user|
  u = User.create(user)
  puts "Created user #{u.id}"
end

# seed cars (user, brand, model, plate, car_type, visible)
cars = [{
  user: User.find(2),
  brand: Auto.first.brand,
  model: Auto.first.model,
  plate: "TFK-#{(0..9).to_a.sample}#{(0..9).to_a.sample}#{(0..9).to_a.sample}#{(0..9).to_a.sample}",
  car_type: 'Sedan',
  visible: true
}, {
  user: User.find(4),
  brand: Auto.last.brand,
  model: Auto.last.model,
  plate: "NGT-#{(0..9).to_a.sample}#{(0..9).to_a.sample}#{(0..9).to_a.sample}#{(0..9).to_a.sample}",
  car_type: 'Hatch',
  visible: true
}]
c = ''
cars.each do |car|
  c = Car.create(car)
  puts "Created car #{c.id}"
end

# seed winches (user, brand, model, plate, winch_type, on_duty, win_lat, win_long, price_per_km, )
winches = [{
  user: User.find(1),
  brand: Guincho.first.brand,
  model: Guincho.first.model,
  plate: 'FOG-9265',
  winch_type: 'carro',
  on_duty: false,
  win_lat: -23.5530633,
  win_long: -46.6824965,
  price_per_km: 10
}, {
  user: User.find(3),
  brand: Guincho.last.brand,
  model: Guincho.last.model,
  plate: 'HNG-7250',
  winch_type: 'carro',
  on_duty: false,
  win_lat: -23.571597,
  win_long: -46.7070911,
  price_per_km: 10
}]
w = ''
winches.each do |winch|
  w = Winch.create(winch)
  puts "Created winch #{w.id}"
end

# # seed photos (user, photo_url)
# photos = [{
#   photo: 'https://avatars1.githubusercontent.com/u/51361326?v=4',
#   user: User.find(1)
# }, {
#   photo: 'https://avatars0.githubusercontent.com/u/7490651?v=4',
#   user: User.find(2)
# }, {
#   photo: 'https://avatars2.githubusercontent.com/u/55855139?v=4',
#   user: User.find(3)
# }, {
#   photo: 'https://avatars2.githubusercontent.com/u/56263436?v=4',
#   user: User.find(4)
# }]
# ph = ''
# photos.each do |photo|
#   ph = Photo.create(photo)
#   puts "Created photo #{ph.id}"
# end

# seed reviews (winch, user, rating, content, visible)
r = ''
20.times do
  r = Review.create({
    rating: (1..5).to_a.sample,
    content: Faker::Lorem.paragraph,
    winch: Winch.find(Winch.all.sample.id),
    user: User.find(Car.all.sample.user.id),
    visible: true
  })
  puts "Created review #{r.id}"
end

#fixed
