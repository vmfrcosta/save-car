# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'
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


